/*
 FormattedOutputViewModel.swift
 
 This ViewModel manages the state and logic for formatted text output.
 
 Tasks:
 - Coordinate with OllamaService for text processing
 - Manage different output formats and their settings
 - Handle formatted text operations (copy, edit, export)
 
 Uses code from:
 - OllamaService.swift
 - TextProcessor.swift
 
 Used by:
 - FormattedOutputView.swift
 
 Refer to ProjectSpecs.md for text formatting and output requirements.
*/

import Foundation
import Combine

class FormattedOutputViewModel: ObservableObject {
    @Published var formattedText: String = ""
    @Published var selectedOutputType: OutputType = .email
    
    private var ollamaService: OllamaService
    private var cancellables: Set<AnyCancellable> = []
    
    init(ollamaService: OllamaService) {
        self.ollamaService = ollamaService
        setupBindings()
    }
    
    func processText(_ inputText: String) {
        ollamaService.processText(inputText, outputType: selectedOutputType)
    }
    
    private func setupBindings() {
        // Set up bindings to OllamaService
    }
}

enum OutputType {
    case email, question, diaryEntry, codingProblem
}