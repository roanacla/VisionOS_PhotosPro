import Foundation

final class AnalyticsService: AnalyticsServiceProtocol {
    func log(event: String) {
        print("[Analytics] Logging event: \(event)")
    }
}
