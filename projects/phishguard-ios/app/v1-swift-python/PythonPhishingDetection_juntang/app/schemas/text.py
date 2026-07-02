from pydantic import BaseModel, Field, field_validator

from typing import Optional
from app.schemas.analysis import AnalysisResult
from app.schemas.common import BaseResponse


# Supported sources for text input
ALLOWED_TEXT_SOURCES = {"sms", "email", "chat", "web", "unknown"}

# Supported language values
ALLOWED_LANGUAGES = {"en", "zh", "en-US", "zh-CN"}


class TextRequest(BaseModel):
    # Raw text content submitted for phishing analysis
    text: str = Field(
        ...,
        min_length=1,
        description="Input text content to be analyzed"
    )

    # Source of the text, such as SMS or email
    source: Optional[str] = Field(
        default="unknown",
        description="Source of the text, e.g. SMS, email, chat"
    )

    # Language of the input text
    language: Optional[str] = Field(
        default="en",
        description="Language of the text"
    )

    # Optional request identifier for traceability
    request_id: Optional[str] = Field(
        default=None,
        description="Optional request ID"
    )

    @field_validator("text")

    def validate_text(cls, value: str) -> str:
        # Remove leading and trailing whitespace
        value = value.strip()

        # Reject empty text after trimming
        if not value:
            raise ValueError("text cannot be empty")

        # Prevent extremely large text input
        if len(value) > 10000:
            raise ValueError("text is too long")

        return value

    @field_validator("source")

    def validate_source(cls, value: Optional[str]) -> Optional[str]:
        if value is None:
            return value

        # Normalize source value
        value = value.strip().lower()

        # Reject unsupported text source types
        if value not in ALLOWED_TEXT_SOURCES:
            raise ValueError(f"Unsupported source: {value}")

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


class TextAnalysisResponse(BaseResponse):
    # Standardized AI analysis output for text input
    data: AnalysisResult = Field(
        ...,
        description="AI analysis result for text input"
    )
class TextRequestCreationResult(BaseModel):
    success: bool = Field(..., description="Whether request creation succeeded")
    data: Optional[TextRequest] = Field(
        default=None,
        description="Created TextRequest object"
    )
    error: Optional[str] = Field(
        default=None,
        description="Validation error message"
    )
class TextRequestFactory:
    @staticmethod
    def create(
        text: str,
        source: Optional[str] = "unknown",
        language: Optional[str] = "en",
        request_id: Optional[str] = None
    ) -> "TextRequestCreationResult":
        try:
            obj = TextRequest(
                text=text,
                source=source,
                language=language,
                request_id=request_id
            )
            return TextRequestCreationResult(success=True, data=obj)
        except Exception as e:
            return TextRequestCreationResult(success=False, error=str(e))

# #Valid Input Case
# #Invalid Input Case – Empty Text
# #Invalid Input Case – Unsupported Source
# #Invalid Input Case – Unsupported Language
# #Response Structure Validation
# test_request0 = TextRequestFactory.create(
#     text=" Your account has been suspended. Click here to verify. ",
#     source="sms",
#     language="en",
#     request_id="req_001"
# )
# print("Valid Input Test")
# print(test_request0)
# print(test_request0.model_dump())
#
# test_request1 = TextRequestFactory.create(
#     text="   ",
#     source="sms",
#     language="en"
# )
# print("Empty Text Error Test")
# print(test_request1)
# print(test_request1.model_dump())
#
# test_request2 = TextRequestFactory.create(
#     text="This is a test message",
#     source="twitter",
#     language="en"
# )
# print("Invalid Source Test")
# print(test_request2)
# print(test_request2.model_dump())
#
# test_request3 = TextRequestFactory.create(
#     text="This is a test message",
#     source="sms",
#     language="fr"
# )
# print("Invalid Language Test")
# print(test_request3)
# print(test_request3.model_dump())
#
# test_response = TextAnalysisResponse(
#     success=True,
#     message="Text analysis completed successfully",
#     request_id="req_002",
#     data=AnalysisResult(
#         risk_score=0.85,
#         verdict="phishing",
#         rationale="The message contains urgent language and a suspicious link.",
#         model_used="tier-2",
#         processing_time_ms=320
#     )
# )
# print("Response Model Test")
# print(test_response)
# print(test_response.model_dump())
