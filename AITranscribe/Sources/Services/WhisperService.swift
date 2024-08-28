/*
 WhisperService.swift
 
 This service manages the integration with the Whisper model for transcription.
 
 Tasks:
 - Initialize and manage the Whisper model
 - Provide high-level transcription methods
 - Handle transcription errors and retries
 
 Uses code from:
 - Transcriber.swift
 
 Used by:
 - TranscriptionViewModel.swift
 
 Refer to ProjectSpecs.md for transcription feature requirements.
*/

import Foundation
import Combine

class WhisperService: ObservableObject {
    private let transcriber: Transcriber
    
    @Published var isTranscribing = false
    @Published var transcriptionProgress: Double = 0
    
    init(transcriber: Transcriber = Transcriber()) {
        self.transcriber = transcriber
    }
    
    func transcribe(_ audioData: Data) -> AnyPublisher<String, Error> {
        isTranscribing = true
        transcriptionProgress = 0
        
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let transcription = self.transcriber.transcribe(audioData)
                    DispatchQueue.main.async {
                        self.isTranscribing = false
                        self.transcriptionProgress = 1.0
                        promise(.success(transcription))
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.isTranscribing = false
                        promise(.failure(error))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}