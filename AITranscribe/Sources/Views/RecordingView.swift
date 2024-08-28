/*
 RecordingView.swift
 
 This view handles the audio recording interface and visualization.
 
 Tasks:
 - Implement audio recording controls (start, stop, pause)
 - Display real-time audio waveform visualization
 - Show recording status and duration
 
 Uses code from:
 - RecordingViewModel.swift
 - AudioVisualizer.swift
 
 Used by:
 - ContentView.swift
 
 Refer to ProjectSpecs.md for audio recording feature specifications.
*/

import SwiftUI

struct RecordingView: View {
    @ObservedObject var viewModel: RecordingViewModel
    
    var body: some View {
        VStack {
            // Audio waveform visualization
            AudioVisualizer(audioData: $viewModel.audioData)
            
            // Recording controls
            HStack {
                Button("Start") {
                    viewModel.startRecording()
                }
                Button("Stop") {
                    viewModel.stopRecording()
                }
                Button("Pause") {
                    viewModel.pauseRecording()
                }
            }
            
            // Recording status and duration
            Text("Recording: \(viewModel.isRecording ? "Yes" : "No")")
            Text("Duration: \(viewModel.recordingDuration.formatted())")
        }
    }
}