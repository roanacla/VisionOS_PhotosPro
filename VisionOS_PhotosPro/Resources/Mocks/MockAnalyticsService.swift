import Foundation

class MockAnalyticsService: AnalyticsServiceProtocol {
    var lastEvent: String?
    
    func log(event: String) {
        lastEvent = event
    }
}
