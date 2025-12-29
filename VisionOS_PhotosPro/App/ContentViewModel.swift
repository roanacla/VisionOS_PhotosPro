import Foundation

@MainActor
@Observable
class ContentViewModel {
    var analyticsService: AnalyticsServiceProtocol
    var networkService: NetworkServiceProtocol
    
    init(analyticalService: AnalyticsServiceProtocol, networkService: NetworkServiceProtocol) {
        self.analyticsService = analyticalService
        self.networkService = networkService
    }
}
