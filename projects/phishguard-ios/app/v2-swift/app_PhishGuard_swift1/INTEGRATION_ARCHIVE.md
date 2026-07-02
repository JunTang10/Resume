# Integration Archive

Main project: `app_PhishGuard_swift/PhishGuard.xcodeproj`

This file records legacy UI/module sources that were reviewed but intentionally not wired into the main app, so the main app keeps one set of user-facing flows.

## Text module

Integrated:
- `PhishingDetection/PhishingDetection/Services/TextService.swift` -> `app_PhishGuard_swift/PhishGuard/Services/TextService.swift`
- TXT import behavior merged into `TextInputPanel` in `PhishGuard/Views/Views.swift`

Preserved as legacy source, not connected:
- `PhishingDetection/PhishingDetection/Views/TextUploadView.swift`

## Audio / ASR module

Already integrated and preserved:
- `Services/AudioService.swift`
- `Models/TranscriptionResult.swift`
- `VoiceInputPanel -> AudioService.transcribeAudio(from:) -> DashboardViewModel.handleVoiceTranscription(...)`

Legacy upload UI remains source-only:
- `PhishingDetection/PhishingDetection/Views/AudioUploadView.swift`

## Video module

Integrated:
- `PhishingDetection/PhishingDetection/Services/VideoService.swift` -> `app_PhishGuard_swift/PhishGuard/Services/VideoService.swift`
- `PhishingDetection/PhishingDetection/Models/VideoTextResult.swift` -> `app_PhishGuard_swift/PhishGuard/Models/VideoTextResult.swift`
- Video import/transcription behavior merged into `VideoInputPanel` in `PhishGuard/Views/Views.swift`

Preserved as legacy source, not connected:
- `PhishingDetection/PhishingDetection/Views/VideoUploadView.swift`

## Duplicate Result / Upload / Analysis UI

Not integrated into the main target because the main app already owns these flows through:
- `AnalyzeView`
- `TextInputPanel`
- `VoiceInputPanel`
- `VideoInputPanel`
- `AnalyzeResultCard`
- `HistoryView`
- `DashboardViewModel`

Preserved as legacy source, not connected:
- `PhishingDetection/PhishingDetection/Views/ResultView.swift`
- `PhishingDetection/PhishingDetection/ViewModels/UploadViewModel.swift`
- `PhishingDetection/PhishingDetection/ViewModels/AnalysisViewModel.swift`
- `PhishingDetection/PhishingDetection/Views/HomeView.swift`
- `PhishingDetection/PhishingDetection/App/ContentView.swift`
- `PhishingDetection/PhishingDetection/App/PhishingDetectionApp.swift`

## Remaining shared Models / Services / Utils

Reviewed and preserved as legacy source, not copied because they are empty placeholders or duplicate existing main-project types/helpers:
- `PhishingDetection/PhishingDetection/Services/AnalysisService.swift`
- `PhishingDetection/PhishingDetection/Models/AnalysisResult.swift`
- `PhishingDetection/PhishingDetection/Models/RiskLevel.swift`
- `PhishingDetection/PhishingDetection/Extensions/View+Style.swift`

Main project equivalents currently remain:
- `PhishGuard/Models/Models.swift`
- shared helper views/functions inside `PhishGuard/Views/Views.swift`
- `PhishGuard/Services/PhishGuardAPI.swift`

## Final main-project structure

Current main-project Swift layout:
- `PhishGuard/App/PhishGuardApp.swift`
- `PhishGuard/Views/Views.swift`
- `PhishGuard/ViewModels/DashboardViewModel.swift`
- `PhishGuard/Models/Models.swift`
- `PhishGuard/Models/TranscriptionResult.swift`
- `PhishGuard/Models/VideoTextResult.swift`
- `PhishGuard/Services/AudioService.swift`
- `PhishGuard/Services/TextService.swift`
- `PhishGuard/Services/VideoService.swift`
- `PhishGuard/Services/PhishGuardAPI.swift`

Legacy source directory remains preserved at `PhishingDetection/`.





