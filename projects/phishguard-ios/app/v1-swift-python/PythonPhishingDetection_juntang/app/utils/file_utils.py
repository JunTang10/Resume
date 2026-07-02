import os
import uuid
from pathlib import Path
from fastapi import UploadFile


# Allowed audio file extensions
ALLOWED_AUDIO_EXTENSIONS = {".mp3", ".wav", ".m4a", ".mp4"}


def ensure_directory(directory: str) -> None:
    """
    Create the target directory if it does not exist.
    """
    Path(directory).mkdir(parents=True, exist_ok=True)


def get_file_extension(filename: str) -> str:
    """
    Return the lowercase file extension of the given filename.
    Example: 'test.MP3' -> '.mp3'
    """
    return Path(filename).suffix.lower()


def is_allowed_audio_file(filename: str) -> bool:
    """
    Check whether the uploaded audio file has a supported extension.
    """
    return get_file_extension(filename) in ALLOWED_AUDIO_EXTENSIONS


def generate_safe_filename(original_filename: str) -> str:
    """
    Generate a unique safe filename to avoid name collision.
    """
    extension = get_file_extension(original_filename)
    return f"{uuid.uuid4().hex}{extension}"


async def save_upload_file(upload_file: UploadFile, save_dir: str) -> str:
    """
    Save the uploaded file into the target directory and return the saved path.
    """
    ensure_directory(save_dir)

    safe_filename = generate_safe_filename(upload_file.filename)
    save_path = os.path.join(save_dir, safe_filename)

    content = await upload_file.read()
    with open(save_path, "wb") as f:
        f.write(content)

    return save_path