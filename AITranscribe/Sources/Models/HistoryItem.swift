/*
 HistoryItem.swift
 
 This model represents a single history item for transcriptions and outputs.
 
 Tasks:
 - Define properties for storing transcription and output data
 - Implement Codable for easy serialization
 - Provide initializer and any necessary methods
 
 Uses code from:
 - None
 
 Used by:
 - HistoryViewModel.swift
 - DatabaseService.swift
 
 Refer to ProjectSpecs.md for history tracking requirements.
*/

import Foundation

struct HistoryItem: Identifiable, Codable {
    let id: UUID
    let timestamp: Date
    let transcription: String
    let formattedOutput: String
    let outputType: OutputType
    
    init(transcription: String, formattedOutput: String, outputType: OutputType) {
        self.id = UUID()
        self.timestamp = Date()
        self.transcription = transcription
        self.formattedOutput = formattedOutput
        self.outputType = outputType
    }
}