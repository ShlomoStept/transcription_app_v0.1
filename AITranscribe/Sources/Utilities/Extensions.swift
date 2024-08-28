/*
 Extensions.swift
 
 This file contains useful extensions to existing types.
 
 Tasks:
 - Implement extensions that are used across multiple files
 - Enhance existing types with additional functionality
 
 Uses code from:
 - None
 
 Used by:
 - Various files across the app
 
 Refer to ProjectSpecs.md for any specific extension requirements.
*/

import Foundation
import SwiftUI

extension Date {
    func formattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}

extension Color {
    static let accentColor = Color(Constants.UI.primaryColor)
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}