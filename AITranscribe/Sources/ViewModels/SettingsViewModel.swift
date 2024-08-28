/*
 SettingsViewModel.swift
 
 This ViewModel manages the app's settings and preferences.
 
 Tasks:
 - Handle loading and saving of app settings
 - Manage settings state and user interactions
 - Coordinate settings import/export functionality
 
 Uses code from:
 - Settings.swift
 - DatabaseService.swift
 
 Used by:
 - SettingsView.swift
 
 Refer to ProjectSpecs.md for settings management requirements.
*/

import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    @Published var settings: Settings
    
    private var databaseService: DatabaseService
    
    init(databaseService: DatabaseService) {
        self.databaseService = databaseService
        self.settings = Settings() // Load default settings
        loadSettings()
    }
    
    func saveSettings() {
        databaseService.saveSettings(settings)
    }
    
    private func loadSettings() {
        if let loadedSettings = databaseService.loadSettings() {
            self.settings = loadedSettings
        }
    }
    
    func importSettings(from url: URL) {
        // Implement settings import logic
    }
    
    func exportSettings(to url: URL) {
        // Implement settings export logic
    }
}