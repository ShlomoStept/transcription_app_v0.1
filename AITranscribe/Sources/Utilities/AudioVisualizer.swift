/*
 AudioVisualizer.swift
 
 This file contains the implementation of the audio waveform visualization.
 
 Tasks:
 - Create a SwiftUI view for visualizing audio data
 - Implement real-time updates for the visualization
 - Optimize performance for smooth animation
 
 Uses code from:
 - None
 
 Used by:
 - RecordingView.swift
 
 Refer to ProjectSpecs.md for audio visualization requirements.
*/

import SwiftUI

struct AudioVisualizer: View {
    @Binding var audioData: [Float]
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for (index, sample) in audioData.enumerated() {
                    let x = CGFloat(index) / CGFloat(audioData.count) * geometry.size.width
                    let y = (1 - CGFloat(sample)) * geometry.size.height / 2
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(Color.accentColor, lineWidth: 2)
        }
    }
}