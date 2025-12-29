import SwiftUI

struct PhotoFeedView: View {
    @State var viewModel: PhotoFeedViewModel
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Array(viewModel.photos.enumerated()), id: \.element.id) { index, photo in
                        Group {
                            RemoteImageView(viewModel: viewModel.makeRemoteImageViewModel(photo.urls.thumb))
                        }
                        .frame(width: 100, height: 100)
                        .onAppear {
                            if index == viewModel.photos.count - 1 {
                                viewModel.loadPhotos()
                            }
                        }
                    }
                }
                .searchable(text: $viewModel.searchText)
                .task(id: viewModel.searchText) {
                    await viewModel.searchPhotosWithDebouncing()
                }
            }
            .task {
                viewModel.loadPhotos()
            }            
        }
    }
}

#Preview {
    let container = AppDependencyContainer()
    PhotoFeedView(viewModel: container.makePhotoFeedViewModel() )
}
