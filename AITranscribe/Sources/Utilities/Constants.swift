/*
 Constants.swift
 
 This file contains app-wide constants and configuration values.
 
 Tasks:
 - Define constant values used throughout the app
 - Group constants by feature or usage
 
 Uses code from:
 - None
 
 Used by:
 - Various files across the app
 
 Refer to ProjectSpecs.md for any specific constant requirements.
*/

import Foundation

enum Constants {
    enum Audio {
        static let sampleRate: Double = 44100
        static let channels: Int = 2
    }
    
    enum Transcription {
        static let defaultLanguage = "en"
        static let maxDuration: TimeInterval = 300 // 5 minutes
    }
    
    enum UI {
        static let primaryColor = "AccentColor"
        static let fontName = "SF Pro"
    }
}