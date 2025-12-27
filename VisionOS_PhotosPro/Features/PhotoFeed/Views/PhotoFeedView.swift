import SwiftUI

struct PhotoFeedView: View {
    var viewModel: PhotoFeedViewModel
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Array(viewModel.photos.enumerated()), id: \.element.id) { index, photo in
                    Group {
                        RemoteImageView(viewModel: .init(url: URL(string:photo.urls.thumb), networkService: NetworkService()))
                    }
                    .frame(width: 100, height: 100)
                    .onAppear {
                        Task {
                            if index == viewModel.photos.count - 1 {
                                await viewModel.fetchPhotos()
                            }
                        }
                    }
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
