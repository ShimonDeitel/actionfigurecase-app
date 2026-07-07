import SwiftUI

enum Theme {
    static let accent = Color(red: 0.9373, green: 0.1882, blue: 0.3294)
    static let background = Color(red: 0.0863, green: 0.0471, blue: 0.0627)
    static let card = Color(red: 0.1490, green: 0.0863, blue: 0.1098)
    static let textPrimary = Color(red: 0.9882, green: 0.9176, blue: 0.9333)
    static let textMuted = Color(red: 0.8392, green: 0.6039, blue: 0.6667)

    static let titleFont = Font.system(.title2, design: .serif).weight(.bold)
    static let bodyFont = Font.system(.body, design: .rounded)
    static let labelFont = Font.system(.caption, design: .rounded).weight(.semibold)
}
