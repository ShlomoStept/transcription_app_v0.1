# AITranscribe: AI-Powered Transcription and Formatting App

## Overview
**AITranscribe** is a Mac application that provides high-quality speech-to-text transcription using a local Whisper model, integrates advanced text processing with Ollama, and offers formatted output based on customizable prompts. The app features a modern, dark-themed UI, robust settings management, history tracking, and advanced audio processing capabilities.

## Key Features
1. **High-Quality Audio Recording with Real-Time Visualization**
2. **Speech-to-Text Transcription (Local Whisper Model)**
3. **Advanced Text Processing & Formatting (Ollama Integration)**
4. **Multiple Output Formats (e.g., Email, Diary, Coding Problem)**
5. **Clipboard Integration & Intelligent Text Insertion**
6. **Customizable Settings Management**
7. **History Tracking with Search & Filter Options**
8. **Real-Time Transcription Display**
9. **Custom Prompt Creation & Management**

## Technology Stack
- **Language**: Swift
- **UI Framework**: SwiftUI
- **Database**: SQLite
- **Core Dependencies**:
  - Whisper (local model)
  - Ollama
  - SQLite.swift
  - AVFoundation

## Project Structure
```
AITranscribe/
├── Sources/
│   ├── AITranscribeApp.swift
│   ├── Views/
│   │   ├── ContentView.swift
│   │   ├── RecordingView.swift
│   │   ├── TranscriptionView.swift
│   │   ├── FormattedOutputView.swift
│   │   ├── SettingsView.swift
│   │   ├── HistoryView.swift
│   │   └── CustomPromptView.swift
│   ├── ViewModels/
│   │   ├── RecordingViewModel.swift
│   │   ├── TranscriptionViewModel.swift
│   │   ├── FormattedOutputViewModel.swift
│   │   ├── SettingsViewModel.swift
│   │   └── HistoryViewModel.swift
│   ├── Models/
│   │   ├── AudioRecorder.swift
│   │   ├── Transcriber.swift
│   │   ├── TextProcessor.swift
│   │   ├── Settings.swift
│   │   └── HistoryItem.swift
│   ├── Services/
│   │   ├── AudioService.swift
│   │   ├── WhisperService.swift
│   │   ├── OllamaService.swift
│   │   ├── DatabaseService.swift
│   │   └── ClipboardService.swift
│   └── Utilities/
│       ├── Constants.swift
│       ├── Extensions.swift
│       └── AudioVisualizer.swift
├── Resources/
│   ├── Assets.xcassets/
│   │   ├── AppIcon.appiconset/
│   │   │   ├── Contents.json
│   │   │   └── Icon_*.png
│   │   └── Colors.xcassets
│   ├── Localizable.strings
│   └── InfoPlist.strings
├── Info.plist
└── AITranscribe.entitlements
```

## Component Overview

### 1. **Audio Recording**
   - **Files**: `AudioRecorder.swift`, `AudioService.swift`
   - Implements high-quality audio capture using `AVAudioEngine`
   - Provides real-time waveform visualization
   - Customizable recording settings and file storage options

### 2. **Speech-to-Text Transcription**
   - **Files**: `Transcriber.swift`, `WhisperService.swift`
   - Integrates a local Whisper model optimized for Mac
   - Offers real-time transcription with multi-language support
   - Handles a wide range of accents and varied audio qualities

### 3. **Advanced Text Processing & Formatting**
   - **Files**: `TextProcessor.swift`, `OllamaService.swift`
   - Integrates Ollama for custom text processing and prompt management
   - Provides multiple output formats with error handling and optimization
   - Supports creating and managing user-defined prompts

### 4. **User Interface & Experience**
   - **Files**: SwiftUI-based views in `Views/` directory
   - Features a sleek dark-themed UI with smooth animations
   - Implements responsive layouts for all views
   - Ensures accessibility compliance for all user interactions

### 5. **Settings Management**
   - **Files**: `Settings.swift`, `SettingsView.swift`
   - Comprehensive settings model for user preferences
   - Stores settings using `UserDefaults` with SQLite backups
   - Supports import/export of settings for easy management

### 6. **History Tracking**
   - **Files**: `HistoryItem.swift`, `HistoryView.swift`
   - Efficient database schema for storing and managing history
   - Implements search, filter, and data export functionality
   - Visualizes usage statistics and provides a user-friendly interface

### 7. **Clipboard Integration & Text Insertion**
   - **Files**: `ClipboardService.swift`
   - Seamless clipboard integration for various text formats
   - Intelligent text insertion at cursor position
   - Supports multi-format text copying and pasting

## Development Roadmap

### Phase 1: Core Functionality
- [ ] Implement audio recording with real-time visualization
- [ ] Integrate and optimize Whisper model for transcription
- [ ] Develop text processing with Ollama and formatted output views
- [ ] Implement clipboard integration and intelligent text insertion
- [ ] Create a comprehensive settings management system
- [ ] Implement history tracking with search, filter, and export
- [ ] Design and build a responsive, dark-themed UI with SwiftUI
- [ ] Develop real-time transcription display

### Phase 2: Enhanced Features
- [ ] Custom prompt creation and management system
- [ ] Voice activation for hands-free operation
- [ ] Support for multiple audio formats and languages
- [ ] Advanced audio processing (e.g., noise reduction, speaker diarization)
- [ ] Integration with cloud storage services for backup and sync
- [ ] Customizable themes, keyboard shortcuts, and Touch Bar support
- [ ] Accessibility enhancements and performance optimization

### Phase 3: Testing & Deployment
- [ ] Comprehensive unit and UI testing
- [ ] Conduct performance profiling and optimizations
- [ ] Refine UI/UX based on user feedback and testing results
- [ ] Prepare the app for App Store submission with all necessary assets

### Documentation & User Support
- [ ] Detailed user guides and help documentation
- [ ] Marketing materials, including website and landing page

## Future Enhancements
- Batch processing of audio files
- Collaboration features for team use
- Plugin system for extensibility
- Cross-platform support (iOS/iPadOS)
- Real-time translation features
- Integration with additional AI models and productivity tools

