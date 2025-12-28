import SwiftUI

@main
struct VisionOS_PhotosProApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(networkService: NetworkService()))
        }
    }
}
