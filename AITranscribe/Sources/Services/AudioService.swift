/*
 AudioService.swift
 
 This service manages audio recording and processing.
 
 Tasks:
 - Coordinate between AudioRecorder and other components
 - Manage audio session and permissions
 - Provide high-level audio control methods
 
 Uses code from:
 - AudioRecorder.swift
 
 Used by:
 - RecordingViewModel.swift
 
 Refer to ProjectSpecs.md for audio recording feature specifications.
*/

import AVFoundation
import Combine

class AudioService: ObservableObject {
    private let audioRecorder: AudioRecorder
    
    @Published var isRecording = false
    @Published var audioData: [Float] = []
    
    init(audioRecorder: AudioRecorder = AudioRecorder()) {
        self.audioRecorder = audioRecorder
        setupBindings()
    }
    
    func startRecording() {
        audioRecorder.startRecording()
    }
    
    func stopRecording() {
        audioRecorder.stopRecording()
    }
    
    func pauseRecording() {
        audioRecorder.pauseRecording()
    }
    
    private func setupBindings() {
        // Set up bindings to AudioRecorder
    }
}