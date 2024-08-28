/*
 OllamaService.swift
 
 This service manages the integration with Ollama for text processing.
 
 Tasks:
 - Initialize and manage the Ollama connection
 - Provide high-level text processing methods
 - Handle different output types and custom prompts
 
 Uses code from:
 - TextProcessor.swift
 
 Used by:
 - FormattedOutputViewModel.swift
 
 Refer to ProjectSpecs.md for text processing and formatting requirements.
*/

import Foundation
import Combine

class OllamaService: ObservableObject {
    private let textProcessor: TextProcessor
    
    @Published var isProcessing = false
    
    init(textProcessor: TextProcessor = TextProcessor()) {
        self.textProcessor = textProcessor
    }
    
    func processText(_ input: String, outputType: OutputType) -> AnyPublisher<String, Error> {
        isProcessing = true
        
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                let processedText = self.textProcessor.processText(input, outputType: outputType)
                DispatchQueue.main.async {
                    self.isProcessing = false
                    promise(.success(processedText))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func applyCustomPrompt(_ input: String, prompt: String) -> AnyPublisher<String, Error> {
        isProcessing = true
        
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                let processedText = self.textProcessor.applyCustomPrompt(input, prompt: prompt)
                DispatchQueue.main.async {
                    self.isProcessing = false
                    promise(.success(processedText))
                }
            }
        }.eraseToAnyPublisher()
    }
}