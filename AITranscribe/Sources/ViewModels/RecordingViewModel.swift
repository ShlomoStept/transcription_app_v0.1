/*
 RecordingViewModel.swift
 
 This ViewModel manages the state and logic for audio recording.
 
 Tasks:
 - Handle audio recording start, stop, and pause actions
 - Manage recording state (isRecording, duration, etc.)
 - Process audio data for visualization
 - Coordinate with AudioService for actual recording functionality
 
 Uses code from:
 - AudioService.swift
 - AudioRecorder.swift
 
 Used by:
 - RecordingView.swift
 
 Refer to ProjectSpecs.md for audio recording feature specifications.
*/

import Foundation
import Combine

class RecordingViewModel: ObservableObject {
    @Published var isRecording: Bool = false
    @Published var recordingDuration: TimeInterval = 0
    @Published var audioData: [Float] = []
    
    private var audioService: AudioService
    private var cancellables: Set<AnyCancellable> = []
    
    init(audioService: AudioService) {
        self.audioService = audioService
        setupBindings()
    }
    
    func startRecording() {
        audioService.startRecording()
    }
    
    func stopRecording() {
        audioService.stopRecording()
    }
    
    func pauseRecording() {
        audioService.pauseRecording()
    }
    
    private func setupBindings() {
        // Set up bindings to AudioService
    }
}