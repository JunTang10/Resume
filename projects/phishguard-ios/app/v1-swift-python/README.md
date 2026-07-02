## v1-swift-python

This folder contains the first prototype version of **PhishGuard**, built with a **Swift frontend** and a **Python backend**.
It was mainly used to test the early workflow of the system. 🚧

### Structure

- ```
  PhishGuardPythonProject_juntang
  ```

  - Python backend built with **FastAPI**
  - Handles text, audio, and video upload requests
  - Uses **Whisper** for speech-to-text transcription 🎙️
  - Converts uploaded content into a unified analysis input format

- ```
  transfer_swiftPhishingDetectionApp
  ```

  - Early **iOS frontend prototype** written in Swift 📱
  - Provides the user interface for uploading and testing phishing-related content
  - Communicates with the backend to send input data and receive processing results

### Purpose of This Version

This version was mainly used to validate the early system workflow:

1. collect user input from the iOS app,
2. send the content to the backend,
3. process different input types separately,
4. convert them into a standard format for phishing analysis.

### Notes

This is an early prototype version of the project.
Later versions gradually moved toward a more integrated Swift-based implementation. 🔄