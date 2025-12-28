import Foundation

@MainActor
@Observable
class ContentViewModel {
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
