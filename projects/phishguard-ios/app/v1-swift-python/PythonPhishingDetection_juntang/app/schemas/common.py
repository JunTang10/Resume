
from pydantic import BaseModel, Field
from typing import Optional
from datetime import datetime

'''''''''''''''''
BaseResponse
-------------------------
success: bool
message: str
timestamp: datetime
request_id: str (optional)

ErrorResponse
-------------------------
success: bool (default=False)
message: str
timestamp: datetime
request_id: str (optional)
error_code: str (optional)
'''''
class BaseResponse(BaseModel):
    # Indicates whether the request was processed successfully
    success: bool = Field(..., description="Whether the request was successful")

    # Human-readable message returned by the backend
    message: str = Field(..., description="Response message")

    # Timestamp automatically generated when the response object is created
    timestamp: datetime = Field(
        default_factory=datetime.utcnow,
        description="Response timestamp"
    )

    # Optional request identifier for tracing and logging
    request_id: Optional[str] = Field(
        default=None,
        description="Unique request ID"
    )


class ErrorResponse(BaseModel):
    # Error responses are unsuccessful by default
    success: bool = Field(
        default=False,
        description="Whether the request was successful"
    )

    # Human-readable error message
    message: str = Field(..., description="Error message")

    # Timestamp automatically generated when the error response is created
    timestamp: datetime = Field(
        default_factory=datetime.utcnow,
        description="Response timestamp"
    )

    # Optional request identifier for debugging and tracing
    request_id: Optional[str] = Field(
        default=None,
        description="Unique request ID"
    )

    # Optional application-specific error code
    error_code: Optional[str] = Field(
        default=None,
        description="Application-specific error code"
    )

''''''''''''''''''''''''''''''''''''''''''''' 

test_success = BaseResponse(
    success=True,
    message="Analysis completed successfully",
     request_id="req_001"
)

test_error = ErrorResponse(
    message="Unsupported file format",
    request_id="req_002",
    error_code="INVALID_FILE"
)

print("BaseResponse test:")
print(test_success)
print(test_success.model_dump())

print("\nErrorResponse test:")
print(test_error)
print(test_error.model_dump())

'''''''''''''''''''''''''''''''''''''''''''''