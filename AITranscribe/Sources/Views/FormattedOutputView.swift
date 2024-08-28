/*
 FormattedOutputView.swift
 
 This view displays the formatted text output based on selected prompts.
 
 Tasks:
 - Show formatted text based on selected output type
 - Implement options for copying, editing, or exporting formatted text
 - Provide UI for selecting different formatting options
 
 Uses code from:
 - FormattedOutputViewModel.swift
 - TextProcessor.swift
 
 Used by:
 - ContentView.swift
 
 Refer to ProjectSpecs.md for text formatting and output requirements.
*/

import SwiftUI

struct FormattedOutputView: View {
    @ObservedObject var viewModel: FormattedOutputViewModel
    
    var body: some View {
        VStack {
            // Display formatted text based on selected output type
            Text(viewModel.formattedText)
                .font(.body)
                .padding()
            
            // Options for copying, editing, or exporting formatted text
            HStack {
                Button("Copy") {
                    // Copy formatted text to clipboard
                }
                Button("Edit") {
                    // Open editor for formatted text
                }
                Button("Export") {
                    // Export formatted text to file or share
                }
            }
            .padding()
            
            // UI for selecting different formatting options
            Picker("Output Type", selection: $viewModel.selectedOutputType) {
                Text("Email").tag(OutputType.email)
                Text("Question").tag(OutputType.question)
                Text("Diary Entry").tag(OutputType.diaryEntry)
                Text("Coding Problem").tag(OutputType.codingProblem)
            }
            .pickerStyle(.menu)
            .padding()
        }
    }
}