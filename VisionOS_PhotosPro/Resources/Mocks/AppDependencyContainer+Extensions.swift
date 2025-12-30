import Foundation

extension AppDependencyContainer {
    static var mock: AppDependencyContainer {
        return AppDependencyContainer(
            networkService: MockNetworkService(),
            imageLoaderService: MockImageLoaderService(),
            analyticsService: MockAnalyticsService()
        )
    }
}
