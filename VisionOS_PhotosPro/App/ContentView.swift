import SwiftUI

struct ContentView: View {
    @State var viewModel: ContentViewModel
        
    var body: some View {
        NavigationStack {
            PhotoFeedView(viewModel: .init(networkService: viewModel.networkService))
        }
    }
}

#Preview {
    ContentView(viewModel: .init(networkService: MockNetworkService()))
}
