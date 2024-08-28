/*
 TranscriptionView.swift
 
 This view displays the transcribed text and handles real-time updates.
 
 Tasks:
 - Show transcribed text with real-time updates
 - Implement text editing capabilities
 - Provide options for saving or processing the transcription
 
 Uses code from:
 - TranscriptionViewModel.swift
 
 Used by:
 - ContentView.swift
 
 Refer to ProjectSpecs.md for transcription feature requirements.
*/

import SwiftUI

struct TranscriptionView: View {
    @ObservedObject var viewModel: TranscriptionViewModel
    
    var body: some View {
        VStack {
            // Real-time transcription display
            Text(viewModel.transcriptionText)
                .font(.body)
                .padding()
            
            // Text editing capabilities
            TextField("Edit Transcription", text: $viewModel.transcriptionText)
                .font(.body)
                .padding()
            
            // Options for saving or processing the transcription
            HStack {
                Button("Save") {
                    // Save transcription logic
                }
                Button("Process") {
                    // Process transcription logic
                }
            }
            .padding()
        }
    }
}