from pydantic import BaseModel, Field, field_validator
from typing import Optional
from app.schemas.analysis import AnalysisResult
from app.schemas.common import BaseResponse


# Allowed file extensions for audio input
ALLOWED_AUDIO_EXTENSIONS = {".mp3", ".wav", ".m4a", ".mp4"}

# Supported languages for ASR processing
ALLOWED_LANGUAGES = {"en", "zh", "en-US", "zh-CN"}


class ASRRequest(BaseModel):
    # Original uploaded audio file name
    file_name: str = Field(
        ...,
        description="Uploaded audio file name"
    )

    # Temporary storage path of the uploaded audio file
    file_path: str = Field(
        ...,
        description="Temporary storage path of the audio file"
    )

    # Language of the audio content
    language: Optional[str] = Field(
        default="en",
        description="Language of the audio"
    )

    # Optional request identifier for traceability
    request_id: Optional[str] = Field(
        default=None,
        description="Optional request ID"
    )

    @field_validator("file_name")

    def validate_file_name(cls, value: str) -> str:
        # Remove leading and trailing whitespace
        value = value.strip()

        # Reject empty file names
        if not value:
            raise ValueError("file_name cannot be empty")

        # Ensure the file name includes an extension
        if "." not in value:
            raise ValueError("file_name must include a valid extension")

        # Extract file suffix and normalize to lowercase
        suffix = "." + value.split(".")[-1].lower()

        # Reject unsupported audio file formats
        if suffix not in ALLOWED_AUDIO_EXTENSIONS:
            raise ValueError(f"Unsupported audio format: {suffix}")

        return value

    @field_validator("file_path")

    def validate_file_path(cls, value: str) -> str:
        # Remove leading and trailing whitespace
        value = value.strip()

        # Reject empty file paths
        if not value:
            raise ValueError("file_path cannot be empty")

        # Basic protection against path traversal patterns
        if ".." in value:
            raise ValueError("file_path contains invalid path traversal pattern")

        return value

    @field_validator("language")

    def validate_language(cls, value: Optional[str]) -> Optional[str]:
        if value is None:
            return value

        # Remove surrounding whitespace
        value = value.strip()

        # Reject unsupported language options
        if value not in ALLOWED_LANGUAGES:
            raise ValueError(f"Unsupported language: {value}")

        return value


class ASRTranscriptionResult(BaseModel):
    # Text produced by the ASR module
    transcript: str = Field(
        ...,
        description="Transcribed text from audio"
    )

    # Confidence score returned by the ASR engine
    confidence: Optional[float] = Field(
        default=None,
        ge=0.0,
        le=1.0,
        description="ASR confidence score"
    )

    @field_validator("transcript")

    def validate_transcript(cls, value: str) -> str:
        # Remove surrounding whitespace
        value = value.strip()

        # Reject empty transcript content
        if not value:
            raise ValueError("transcript cannot be empty")

        return value


class ASRAnalysisResponse(BaseResponse):
    # Stores the intermediate ASR transcription output
    transcript_result: ASRTranscriptionResult = Field(
        ...,
        description="ASR transcription result"
    )

    # Stores the final phishing analysis result based on the transcript
    data: AnalysisResult = Field(
        ...,
        description="AI phishing analysis result based on transcript"
    )
class ASRRequestCreationResult(BaseModel):
    success: bool = Field(..., description="Whether request creation succeeded")
    data: Optional[ASRRequest] = Field(
        default=None,
        description="Created ASRRequest object"
    )
    error: Optional[str] = Field(
        default=None,
        description="Validation error message"
    )


class ASRRequestFactory:
    @staticmethod
    def create(
        file_name: str,
        file_path: str,
        language: Optional[str] = "en",
        request_id: Optional[str] = None
    ) -> ASRRequestCreationResult:
        try:
            request = ASRRequest(
                file_name=file_name,
                file_path=file_path,
                language=language,
                request_id=request_id
            )
            return ASRRequestCreationResult(
                success=True,
                data=request,
                error=None
            )
        except Exception as e:
            return ASRRequestCreationResult(
                success=False,
                data=None,
                error=str(e)
            )
class ASRTranscriptionCreationResult(BaseModel):
    success: bool = Field(..., description="Whether transcription result creation succeeded")
    data: Optional[ASRTranscriptionResult] = Field(
        default=None,
        description="Created ASRTranscriptionResult object"
    )
    error: Optional[str] = Field(
        default=None,
        description="Validation error message"
    )


class ASRTranscriptionResultFactory:
    @staticmethod
    def create(
        transcript: str,
        confidence: Optional[float] = None
    ) -> ASRTranscriptionCreationResult:
        try:
            result = ASRTranscriptionResult(
                transcript=transcript,
                confidence=confidence
            )
            return ASRTranscriptionCreationResult(
                success=True,
                data=result,
                error=None
            )
        except Exception as e:
            return ASRTranscriptionCreationResult(
                success=False,
                data=None,
                error=str(e)
            )

# # Valid ASR Request Test
# test_asr_request0 = ASRRequestFactory.create(
#     file_name="sample.mp3",
#     file_path="/tmp/sample.mp3",
#     language="en",
#     request_id="req_001"
# )
# print("Valid ASR Request Test")
# print(test_asr_request0)
# print(test_asr_request0.model_dump())
#
#
# # Empty File Name Error Test
# test_asr_request1 = ASRRequestFactory.create(
#     file_name="   ",
#     file_path="/tmp/sample.mp3",
#     language="en"
# )
# print("\nEmpty File Name Error Test")
# print(test_asr_request1)
# print(test_asr_request1.model_dump())
#
#
# # Invalid Audio Format Test
# test_asr_request2 = ASRRequestFactory.create(
#     file_name="sample.txt",
#     file_path="/tmp/sample.txt",
#     language="en"
# )
# print("\nInvalid Audio Format Test")
# print(test_asr_request2)
# print(test_asr_request2.model_dump())
#
#
# # Invalid File Path Test
# test_asr_request3 = ASRRequestFactory.create(
#     file_name="sample.mp3",
#     file_path="../secret/sample.mp3",
#     language="en"
# )
# print("\nInvalid File Path Test")
# print(test_asr_request3)
# print(test_asr_request3.model_dump())
#
#
# # Invalid Language Test
# test_asr_request4 = ASRRequestFactory.create(
#     file_name="sample.mp3",
#     file_path="/tmp/sample.mp3",
#     language="fr"
# )
# print("\nInvalid Language Test")
# print(test_asr_request4)
# print(test_asr_request4.model_dump())
#
#
# # Valid Transcription Result Test
# test_transcription0 = ASRTranscriptionResultFactory.create(
#     transcript="Your account has been suspended. Click here to verify.",
#     confidence=0.92
# )
# print("\nValid Transcription Result Test")
# print(test_transcription0)
# print(test_transcription0.model_dump())
#
#
# # Empty Transcript Error Test
# test_transcription1 = ASRTranscriptionResultFactory.create(
#     transcript="   ",
#     confidence=0.85
# )
# print("\nEmpty Transcript Error Test")
# print(test_transcription1)
# print(test_transcription1.model_dump())
#
#
# # Valid ASR Analysis Response Test
# test_asr_response = ASRAnalysisResponse(
#     success=True,
#     message="ASR analysis completed successfully",
#     request_id="req_005",
#     transcript_result=ASRTranscriptionResult(
#         transcript="Your account has been suspended. Click here to verify.",
#         confidence=0.92
#     ),
#     data=AnalysisResult(
#         risk_score=0.88,
#         verdict="phishing",
#         rationale="The transcript contains urgent language and suspicious instructions.",
#         model_used="tier-2",
#         processing_time_ms=500
#     )
# )
#
# print("\nValid ASR Analysis Response Test")
# print(test_asr_response)
# print(test_asr_response.model_dump())
