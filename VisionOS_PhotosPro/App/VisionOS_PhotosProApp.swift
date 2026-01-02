import SwiftUI

@main
struct VisionOS_PhotosProApp: App {
    // 1. Long-lived Dependency Container
    @State var container = AppDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $container.navigationRouter.path) {
                PhotoFeedView(viewModel: container.makePhotoFeedViewModel(router: container.navigationRouter))
                    .navigationDestination(for: AppDestination.self) { destination in
                        container.makeDestinationView(for: destination)
                    }
            }
        }
    }
}
