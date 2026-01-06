import SwiftUI

@main
struct VisionOS_PhotosProApp: App {
    // 1. Long-lived Dependency Container
    @State var container = AppDependencyContainer()
    // 2. New Feature State
    @State private var displaySettings = DisplaySettings()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $container.navigationRouter.path) {
                PhotoFeedView(viewModel: container.makePhotoFeedViewModel(router: container.navigationRouter))
                    .navigationDestination(for: AppDestination.self) { destination in
                        container.makeDestinationView(for: destination)
                    }
            }
            // FIX: Inject into the specific KeyPath (\.displaySettings), not just the generic type.
            // This ensures the view reads the exact instance declared above.
            .environment(\.displaySettings, displaySettings)
        }
    }
}
