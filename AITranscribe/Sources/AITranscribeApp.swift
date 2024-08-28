/*
 AITranscribeApp.swift
 
 This is the main entry point for the AITranscribe application.
 
 Tasks:
 - Set up the app's main window and initial view
 - Configure any app-wide settings or services
 - Handle app lifecycle events
 
 Uses code from:
 - ContentView.swift
 - SettingsViewModel.swift (for app-wide settings)
 
 Used by:
 - This is the root file and isn't directly used by other files
 
 Refer to ProjectSpecs.md for overall app structure and features.
*/

import SwiftUI

@main
struct AITranscribeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}