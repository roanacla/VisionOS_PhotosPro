import Foundation

final class AppDependencyContainer {
    let networkService: NetworkServiceProtocol
    let imageLoaderService: ImageLoaderServiceProtocol
    let analyticsService: AnalyticsServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(), imageLoaderService: ImageLoaderServiceProtocol = ImageLoaderService.shared, analyticsService: AnalyticsServiceProtocol = AnalyticsService()) {
        self.networkService = networkService
        self.imageLoaderService = imageLoaderService
        self.analyticsService = analyticsService
    }
    
    func makeContentViewModel() -> ContentViewModel {
        ContentViewModel(analyticalService: analyticsService, networkService: networkService)
    }
    
    func makePhotoFeedViewModel() -> PhotoFeedViewModel {
        PhotoFeedViewModel(analyticsService: analyticsService, networkService: networkService)
    }
    
    func makeRemoteImageViewModel(imageURL: String) -> RemoteImageViewModel {
        RemoteImageViewModel(imageURL: imageURL, networkService: networkService, imageLoaderService: imageLoaderService)
    }
}
