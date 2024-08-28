/*
 TranscriptionViewModel.swift
 
 This ViewModel manages the state and logic for speech-to-text transcription.
 
 Tasks:
 - Coordinate with WhisperService for transcription
 - Manage transcription state and updates
 - Handle transcription editing and saving
 
 Uses code from:
 - WhisperService.swift
 - Transcriber.swift
 
 Used by:
 - TranscriptionView.swift
 
 Refer to ProjectSpecs.md for transcription feature requirements.
*/

import Foundation
import Combine

class TranscriptionViewModel: ObservableObject {
    @Published var transcriptionText: String = ""
    
    private var whisperService: WhisperService
    private var cancellables: Set<AnyCancellable> = []
    
    init(whisperService: WhisperService) {
        self.whisperService = whisperService
        setupBindings()
    }
    
    func transcribeAudio(_ audioData: Data) {
        whisperService.transcribe(audioData)
    }
    
    private func setupBindings() {
        // Set up bindings to WhisperService
    }
}