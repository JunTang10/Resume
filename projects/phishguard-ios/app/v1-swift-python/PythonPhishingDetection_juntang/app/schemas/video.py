from pydantic import BaseModel, Field, field_validator
from typing import Optional
from app.schemas.analysis import AnalysisResult
from app.schemas.common import BaseResponse


# Allowed file extensions for video input
ALLOWED_VIDEO_EXTENSIONS = {".mp4", ".mov", ".avi", ".mkv"}


class VideoRequest(BaseModel):
    # Original uploaded video file name
    file_name: str = Field(
        ...,
        description="Uploaded video file name"
    )

    # Temporary storage path of the uploaded video file
    file_path: str = Field(
        ...,
        description="Temporary storage path of the video file"
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

        # Reject unsupported video formats
        if suffix not in ALLOWED_VIDEO_EXTENSIONS:
            raise ValueError(f"Unsupported video format: {suffix}")

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


class VideoExtractionResult(BaseModel):
    # Text extracted from video by OCR, subtitles, or ASR
    extracted_text: str = Field(
        ...,
        description="Extracted text from video (OCR, subtitles, or ASR)"
    )

    # Method used to extract text from the video
    method: Optional[str] = Field(
        default=None,
        description="Extraction method used"
    )

    @field_validator("extracted_text")

    def validate_extracted_text(cls, value: str) -> str:
        # Remove surrounding whitespace
        value = value.strip()

        # Reject empty extracted text
        if not value:
            raise ValueError("extracted_text cannot be empty")

        return value


class VideoAnalysisResponse(BaseResponse):
    # Stores the intermediate extracted text result
    extraction_result: VideoExtractionResult = Field(
        ...,
        description="Text extracted from video"
    )

    # Stores the final phishing analysis result
    data: AnalysisResult = Field(
        ...,
        description="AI phishing analysis result"
    )

class VideoRequestCreationResult(BaseModel):
    success: bool = Field(..., description="Whether request creation succeeded")
    data: Optional[VideoRequest] = Field(
        default=None,
        description="Created VideoRequest object"
    )
    error: Optional[str] = Field(
        default=None,
        description="Validation error message"
    )


class VideoRequestFactory:
    @staticmethod
    def create(
        file_name: str,
        file_path: str,
        request_id: Optional[str] = None
    ) -> VideoRequestCreationResult:
        try:
            request = VideoRequest(
                file_name=file_name,
                file_path=file_path,
                request_id=request_id
            )
            return VideoRequestCreationResult(
                success=True,
                data=request,
                error=None
            )
        except Exception as e:
            return VideoRequestCreationResult(
                success=False,
                data=None,
                error=str(e)
            )

class VideoExtractionCreationResult(BaseModel):
    success: bool = Field(..., description="Whether extraction result creation succeeded")
    data: Optional[VideoExtractionResult] = Field(
        default=None,
        description="Created VideoExtractionResult object"
    )
    error: Optional[str] = Field(
        default=None,
        description="Validation error message"
    )


class VideoExtractionResultFactory:
    @staticmethod
    def create(
        extracted_text: str,
        method: Optional[str] = None
    ) -> VideoExtractionCreationResult:
        try:
            result = VideoExtractionResult(
                extracted_text=extracted_text,
                method=method
            )
            return VideoExtractionCreationResult(
                success=True,
                data=result,
                error=None
            )
        except Exception as e:
            return VideoExtractionCreationResult(
                success=False,
                data=None,
                error=str(e)
            )
1
# #1. Valid Video Request Test
# test_video_request0 = VideoRequestFactory.create(
#     file_name="sample.mp4",
#     file_path="/tmp/sample.mp4",
#     request_id="req_001"
# )
#
# print(test_video_request0)
# print(test_video_request0.model_dump())
# #2. Empty File Name Error Test
# test_video_request1 = VideoRequestFactory.create(
#     file_name="   ",
#     file_path="/tmp/sample.mp4",
#     request_id="req_002"
# )
#
# print(test_video_request1)
# print(test_video_request1.model_dump())
# #3. Invalid Video Format Test
# test_video_request2 = VideoRequestFactory.create(
#     file_name="sample.txt",
#     file_path="/tmp/sample.txt",
#     request_id="req_003"
# )
#
# print(test_video_request2)
# print(test_video_request2.model_dump())
# #4. Invalid File Path Test
# test_video_request3 = VideoRequestFactory.create(
#     file_name="sample.mp4",
#     file_path="../secret/sample.mp4",
#     request_id="req_004"
# )
#
# print(test_video_request3)
# print(test_video_request3.model_dump())
# #5. Valid Extraction Result Test
# test_extraction0 = VideoExtractionResultFactory.create(
#     extracted_text="Your account has been suspended. Click here to verify.",
#     method="OCR"
# )
#
# print(test_extraction0)
# print(test_extraction0.model_dump())
# #6. Empty Extracted Text Error Test
# test_extraction1 = VideoExtractionResultFactory.create(
#     extracted_text="   ",
#     method="ASR"
# )
#
# print(test_extraction1)
# print(test_extraction1.model_dump())
# #7. Valid Video Analysis Response Test
# test_video_response = VideoAnalysisResponse(
#     success=True,
#     message="Video analysis completed successfully",
#     request_id="req_005",
#     extraction_result=VideoExtractionResult(
#         extracted_text="Your account has been suspended. Click here to verify.",
#         method="OCR"
#     ),
#     data=AnalysisResult(
#         risk_score=0.91,
#         verdict="phishing",
#         rationale="The extracted text contains urgent language and a suspicious verification request.",
#         model_used="tier-3",
#         processing_time_ms=850
#     )
# )
#
# print(test_video_response)
# print(test_video_response.model_dump())
