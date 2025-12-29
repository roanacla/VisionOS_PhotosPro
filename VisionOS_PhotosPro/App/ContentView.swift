import SwiftUI

struct ContentView: View {
    @State var viewModel: ContentViewModel
        
    var body: some View {
        NavigationStack {
            // I feel like I need to use the dependency container here
            PhotoFeedView(viewModel: .init(analyticsService: viewModel.analyticsService, networkService: viewModel.networkService))
        }
    }
}

#Preview {
    ContentView(viewModel: .init(analyticalService: AnalyticsService(), networkService: MockNetworkService()))
}
