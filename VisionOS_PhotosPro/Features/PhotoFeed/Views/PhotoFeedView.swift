import SwiftUI

struct PhotoFeedView: View {
    @State var viewModel: PhotoFeedViewModel
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Array(viewModel.photos.enumerated()), id: \.element.id) { index, photo in
                    Group {
                        RemoteImageView(viewModel: .init(imageURL: photo.urls.thumb, networkService: NetworkService(), imageLoaderService: ImageLoaderService.shared))
                    }
                    .frame(width: 100, height: 100)
                    .onAppear {
                        viewModel.loadPhotos()
                    }
                }
            }
            .searchable(text: $viewModel.searchText)
            .task(id: viewModel.searchText) {
                viewModel.searchPhotosWithDebouncing()
            }
        }
        .task {
            viewModel.loadPhotos()
        }
    }
}

#Preview {
    let networkService = MockNetworkService()
    PhotoFeedView(viewModel: .init(networkService: networkService))
}
