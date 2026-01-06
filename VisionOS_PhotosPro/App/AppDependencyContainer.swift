import Foundation
import SwiftUI

@Observable
final class AppDependencyContainer {
    let networkService: NetworkServiceProtocol
    let imageLoaderService: ImageLoaderServiceProtocol
    let analyticsService: AnalyticsServiceProtocol
    var navigationRouter: NavigationRouter
    
    init(networkService: NetworkServiceProtocol = NetworkService(), imageLoaderService: ImageLoaderServiceProtocol = ImageLoaderService.shared, analyticsService: AnalyticsServiceProtocol = AnalyticsService()) {
        self.networkService = networkService
        self.imageLoaderService = imageLoaderService
        self.analyticsService = analyticsService
        self.navigationRouter = NavigationRouter()
    }
    
    func makePhotoFeedViewModel(router: NavigationRouter) -> PhotoFeedViewModel {
        PhotoFeedViewModel(analyticsService: analyticsService,
                           networkService: networkService,
                           navigationRouter: router,
                           makeRemoteImageViewModel: makeRemoteImageViewModel)
    }
    
    func makeRemoteImageViewModel(imageURL: String) -> RemoteImageViewModel {
        RemoteImageViewModel(imageURL: imageURL,
                             networkService: networkService,
                             imageLoaderService: imageLoaderService)
    }
    
    @ViewBuilder
    func makeDestinationView(for destination: AppDestination) -> some View {
        switch destination {
        case .detail(let photo):
            // The container resolves dependencies for the Detail View here
            PhotoDetailView(viewModel: makeRemoteImageViewModel(imageURL: photo.urls.full))
        }
    }
}
