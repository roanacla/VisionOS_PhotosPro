import SwiftUI

@main
struct VisionOS_PhotosProApp: App {
    let container = AppDependencyContainer()
    var body: some Scene {
        WindowGroup {
            PhotoFeedView(viewModel: container.makePhotoFeedViewModel())
        }
    }
}
