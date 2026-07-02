import os
import logging
from typing import Optional, Tuple

import whisper

from app.schemas.asr import ASRRequest, ASRTranscriptionResult
from app.schemas.analysis import AnalysisInput
from app.utils.file_utils import is_allowed_audio_file, save_upload_file


# =========================
# Logging configuration
# =========================
logger = logging.getLogger(__name__)


# =========================
# Language mapping
# Map schema language values to Whisper-supported language codes
# =========================
LANGUAGE_MAPPING = {
    "en": "en",
    "en-US": "en",
    "zh": "zh",
    "zh-CN": "zh"
}


class ASRService:
    """
    ASR service for processing uploaded audio files and converting them to text.
    This version is closer to a production-style service:
    - centralised Whisper model loading
    - structured logging
    - safer exception handling
    - validation and defensive checks
    """

    _model = None
    _model_name = "base"

    @classmethod
    def get_model(cls):
        """
        Load Whisper model only once and reuse it across requests.
        """
        if cls._model is None:
            try:
                logger.info("Loading Whisper model: %s", cls._model_name)
                cls._model = whisper.load_model(cls._model_name)
                logger.info("Whisper model loaded successfully")
            except Exception as e:
                logger.exception("Failed to load Whisper model")
                raise RuntimeError(f"Failed to load Whisper model: {str(e)}") from e
        return cls._model

    @staticmethod
    def _normalize_language(language: Optional[str]) -> str:
        """
        Convert input language into a Whisper-compatible language code.
        Default to English if input is missing or unsupported.
        """
        if not language:
            logger.warning("No language provided, defaulting to 'en'")
            return "en"

        mapped_language = LANGUAGE_MAPPING.get(language)
        if mapped_language is None:
            logger.warning(
                "Unsupported language '%s', defaulting to 'en'",
                language
            )
            return "en"

        return mapped_language

    @staticmethod
    async def process_audio_file(
        upload_file,
        language: str = "en",
        request_id: Optional[str] = None
    ) -> Tuple[ASRRequest, ASRTranscriptionResult]:
        """
        Process uploaded audio file:
        1. validate filename
        2. validate extension
        3. save file locally
        4. transcribe with Whisper
        5. return metadata + transcription result
        """
        logger.info(
            "Starting audio processing | filename=%s | language=%s | request_id=%s",
            getattr(upload_file, "filename", None),
            language,
            request_id
        )

        try:
            # Validate uploaded file object
            if upload_file is None:
                logger.error("No upload file object received")
                raise ValueError("No uploaded file received")

            # Validate filename
            if not upload_file.filename:
                logger.error("Uploaded file has no filename")
                raise ValueError("Uploaded file must have a filename")

            # Validate supported extension
            if not is_allowed_audio_file(upload_file.filename):
                logger.error("Unsupported audio file type: %s", upload_file.filename)
                raise ValueError("Unsupported audio file type")

            # Save uploaded file
            save_path = await save_upload_file(upload_file, "uploads/audio")
            logger.info("Uploaded file saved successfully: %s", save_path)

            # Ensure file exists
            if not os.path.exists(save_path):
                logger.error("Saved file not found on disk: %s", save_path)
                raise FileNotFoundError("Saved audio file does not exist")

            # Build metadata object
            metadata = ASRRequest(
                file_name=upload_file.filename,
                file_path=save_path,
                language=language,
                request_id=request_id
            )

            # Normalize language for Whisper
            whisper_language = ASRService._normalize_language(language)
            logger.info(
                "Language normalized for Whisper | input=%s | whisper=%s",
                language,
                whisper_language
            )

            # Load model
            model = ASRService.get_model()

            # Run transcription
            logger.info("Running Whisper transcription for file: %s", save_path)
            result = model.transcribe(save_path, language=whisper_language)

            # Defensive result parsing
            transcript_text = ""
            if isinstance(result, dict):
                transcript_text = result.get("text", "").strip()

            if not transcript_text:
                logger.warning(
                    "Transcription completed but returned empty text | file=%s",
                    save_path
                )

            # Build transcription result
            transcription = ASRTranscriptionResult(
                transcript=transcript_text,
                confidence=None
            )

            logger.info(
                "Audio transcription completed successfully | filename=%s | request_id=%s",
                upload_file.filename,
                request_id
            )

            return metadata, transcription

        except ValueError:
            logger.exception(
                "Validation error during audio processing | filename=%s | request_id=%s",
                getattr(upload_file, "filename", None),
                request_id
            )
            raise

        except FileNotFoundError:
            logger.exception(
                "File handling error during audio processing | filename=%s | request_id=%s",
                getattr(upload_file, "filename", None),
                request_id
            )
            raise

        except RuntimeError:
            logger.exception(
                "Runtime error during audio processing | filename=%s | request_id=%s",
                getattr(upload_file, "filename", None),
                request_id
            )
            raise

        except Exception as e:
            logger.exception(
                "Unexpected error during audio processing | filename=%s | request_id=%s",
                getattr(upload_file, "filename", None),
                request_id
            )
            raise RuntimeError(f"Unexpected ASR processing error: {str(e)}") from e

    @staticmethod
    def to_analysis_input(
        metadata: ASRRequest,
        transcription: ASRTranscriptionResult
    ) -> AnalysisInput:
        """
        Convert ASR output into standardised analysis input.
        """
        try:
            analysis_input = AnalysisInput(
                text=transcription.transcript,
                source="audio_asr",
                language=metadata.language,
                request_id=metadata.request_id,
                file_name=metadata.file_name
            )

            logger.info(
                "Analysis input created successfully | request_id=%s | file_name=%s",
                metadata.request_id,
                metadata.file_name
            )
            logger.debug("Analysis input content: %s", analysis_input.model_dump())

            return analysis_input

        except Exception as e:
            logger.exception(
                "Failed to convert ASR result to analysis input | request_id=%s",
                getattr(metadata, "request_id", None)
            )
            raise RuntimeError(f"Failed to build analysis input: {str(e)}") from e