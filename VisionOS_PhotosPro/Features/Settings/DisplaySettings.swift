import SwiftUI

//@MainActor
@Observable
class DisplaySettings {
    enum GridDensity: String, CaseIterable, Identifiable {
        case compact = "Compact"
        case comfortable = "Comfortable"
        
        var id: String { rawValue }
        
        var minItemSize: CGFloat {
            switch self {
            case .compact: return 80
            case .comfortable: return 160
            }
        }
    }
    
    var density: GridDensity = .compact
}

// MARK: - Environment Entry
// This defines the key and default value in one go (Swift 6 / iOS 18+)
extension EnvironmentValues {
    @Entry var displaySettings = DisplaySettings()
}
