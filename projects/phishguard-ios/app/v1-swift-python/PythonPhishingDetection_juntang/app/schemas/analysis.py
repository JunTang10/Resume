from pydantic import BaseModel, Field
from typing import Annotated, Optional, Literal

'''''''''''''''''''''
RiskIndicator
-------------------------
type
content
severity
AnalysisResult
-------------------------
risk_score
verdict
rationale
indicators
model_used
processing_time_ms
'''''
class RiskIndicator(BaseModel):
    type: str = Field(..., description="Type of phishing indicator")
    content: str = Field(..., description="Suspicious content or evidence")
    severity: Literal["low", "medium", "high"] = Field(
        ...,
        description="Severity level"
    )


class AnalysisInput(BaseModel):
    # The unified text input for analysis
    text: str

    # Source of the data (e.g., text, audio_asr, video_ocr)
    source: str

    # Language of the content
    language: str

    # Optional request ID for tracing
    request_id: Optional[str] = None

    # Optional original filename (useful for debugging/logging)
    file_name: Optional[str] = None

class AnalysisResult(BaseModel):
    risk_score: float = Field(
        ...,
        ge=0.0,
        le=1.0,
        description="Phishing risk score between 0 and 1"
    )

    verdict: Literal["safe", "suspicious", "phishing"] = Field(
        ...,
        description="Final classification result"
    )

    rationale: str = Field(
        ...,
        description="Explanation of the analysis result"
    )

    indicators: Annotated[
        list[RiskIndicator],
        Field(default_factory=list, description="Detected suspicious indicators")
    ]


    model_used: Optional[str] = Field(
        default=None,
        description="AI model or analysis tier used"
    )

    processing_time_ms: Optional[int] = Field(
        default=None,
        ge=0,
        description="Processing time in milliseconds"
    )
'''''''''''''''''''''''''''''''''''''''''''''
test_result = AnalysisResult(
    risk_score=0.8,
    verdict="phishing",
    rationale="Suspicious link detected"
)

print(test_result)
'''''''''''''''''''''''''''''''''''''''''''''