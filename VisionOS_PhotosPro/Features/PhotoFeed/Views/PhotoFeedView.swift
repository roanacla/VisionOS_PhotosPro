import SwiftUI

struct PhotoFeedView: View {
    var viewModel: PhotoFeedViewModel
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.photos) { photo in
                    Text(photo.title)
                }
            }
        }
        .task {
            await viewModel.fetchPhotos()
        }
    }
}

#Preview {
    let networkService = MockNetworkService()
    PhotoFeedView(viewModel: .init(networkService: networkService))
}
