/*
 Settings.swift
 
 This model represents the app's settings and preferences.
 
 Tasks:
 - Define all configurable settings as properties
 - Implement Codable for easy serialization
 - Provide default values for settings
 
 Uses code from:
 - None
 
 Used by:
 - SettingsViewModel.swift
 - DatabaseService.swift
 
 Refer to ProjectSpecs.md for settings management requirements.
*/

import Foundation

struct Settings: Codable {
    var darkModeEnabled: Bool = true
    var defaultOutputType: OutputType = .email
    var audioQuality: AudioQuality = .high
    var whisperModelSize: WhisperModelSize = .base
    var customPrompt: String = ""
    
    // Add more settings as needed
}

enum AudioQuality: String, Codable {
    case low, medium, high
}

enum WhisperModelSize: String, Codable {
    case tiny, base, small, medium, large
}