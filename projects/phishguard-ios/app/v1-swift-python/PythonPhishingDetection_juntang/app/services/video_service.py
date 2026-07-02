import os
import logging
import subprocess
from typing import Optional, Tuple

import whisper

from app.schemas.video import VideoRequest, VideoExtractionResult, ALLOWED_VIDEO_EXTENSIONS
from app.schemas.analysis import AnalysisInput
from app.utils.file_utils import save_upload_file

logger = logging.getLogger(__name__)

LANGUAGE_MAPPING = {
    "en": "en",
    "en-US": "en",
    "zh": "zh",
    "zh-CN": "zh"
}


class VideoService:
    _model = None
    _model_name = "base"

    @classmethod
    def get_model(cls):
        if cls._model is None:
            try:
                logger.info("Loading Whisper model for video service: %s", cls._model_name)
                cls._model = whisper.load_model(cls._model_name)
                logger.info("Whisper model loaded successfully in video service")
            except Exception as e:
                logger.exception("Failed to load Whisper model in video service")
                raise RuntimeError(f"Failed to load Whisper model: {str(e)}") from e
        return cls._model

    @staticmethod
    def is_allowed_video_file(filename: str) -> bool:
        if not filename:
            return False
        _, ext = os.path.splitext(filename)
        return ext.lower() in ALLOWED_VIDEO_EXTENSIONS

    @staticmethod
    def normalize_language(language: Optional[str]) -> str:
        if not language:
            return "en"
        return LANGUAGE_MAPPING.get(language, "en")

    @staticmethod
    def extract_audio_from_video(video_path: str) -> str:
        audio_path = os.path.splitext(video_path)[0] + ".wav"

        try:
            logger.info("Extracting audio from video: %s", video_path)
            subprocess.run(
                [
                    "ffmpeg",
                    "-y",
                    "-i", video_path,
                    "-vn",
                    "-acodec", "pcm_s16le",
                    "-ar", "16000",
                    "-ac", "1",
                    audio_path
                ],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
            )
            logger.info("Audio extracted successfully: %s", audio_path)
            return audio_path
        except subprocess.CalledProcessError as e:
            logger.exception("Failed to extract audio from video")
            raise RuntimeError("Failed to extract audio from video") from e

    @staticmethod
    async def process_video_file(
        upload_file,
        language: str = "en",
        request_id: Optional[str] = None
    ) -> Tuple[VideoRequest, VideoExtractionResult]:
        logger.info(
            "Starting video processing | filename=%s | language=%s | request_id=%s",
            getattr(upload_file, "filename", None),
            language,
            request_id
        )

        if upload_file is None:
            raise ValueError("No uploaded file received")

        if not upload_file.filename:
            raise ValueError("Uploaded video file must have a filename")

        if not VideoService.is_allowed_video_file(upload_file.filename):
            raise ValueError("Unsupported video file type")

        save_path = await save_upload_file(upload_file, "uploads/video")
        logger.info("Video file saved successfully: %s", save_path)

        if not os.path.exists(save_path):
            raise FileNotFoundError("Saved video file does not exist")

        metadata = VideoRequest(
            file_name=upload_file.filename,
            file_path=save_path,
            request_id=request_id
        )

        audio_path = VideoService.extract_audio_from_video(save_path)

        if not os.path.exists(audio_path):
            raise FileNotFoundError("Extracted audio file does not exist")

        whisper_language = VideoService.normalize_language(language)
        model = VideoService.get_model()

        logger.info("Running Whisper transcription on extracted audio: %s", audio_path)
        result = model.transcribe(audio_path, language=whisper_language)

        extracted_text = ""
        if isinstance(result, dict):
            extracted_text = result.get("text", "").strip()

        extraction_result = VideoExtractionResult(
            extracted_text=extracted_text,
            method="ASR"
        )

        logger.info(
            "Video processing completed successfully | filename=%s | request_id=%s",
            upload_file.filename,
            request_id
        )

        return metadata, extraction_result

    @staticmethod
    def to_analysis_input(
        metadata: VideoRequest,
        extraction_result: VideoExtractionResult,
        language: str = "en"
    ) -> AnalysisInput:
        analysis_input = AnalysisInput(
            text=extraction_result.extracted_text,
            source="video_asr",
            language=language,
            request_id=metadata.request_id,
            file_name=metadata.file_name
        )

        logger.info(
            "Analysis input created from video successfully | request_id=%s | file_name=%s",
            metadata.request_id,
            metadata.file_name
        )

        return analysis_input