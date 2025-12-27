import SwiftUI

@main
struct VisionOS_PhotosProApp: App {
    var body: some Scene {
        WindowGroup {
            PhotoFeedView(viewModel: PhotoFeedViewModel(networkService: NetworkService()))
        }
    }
}
