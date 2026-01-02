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
                        Button {
                            viewModel.navigationRouter.navigate(to: .detail(photo))
                        } label: {
                            ThumbnailImageView(viewModel: viewModel.makeRemoteImageViewModel(photo.urls.thumb))
                        }
                        .onAppear {
                            Task {
                                if index == viewModel.photos.count - 1 {
                                    await viewModel.loadPhotos()
                                }
                            }
                        }
                    }
                }
                .searchable(text: $viewModel.searchText)
                .task(id: viewModel.searchText) {
                    await viewModel.searchPhotosWithDebouncing()
                }
                .task {
                    await viewModel.onViewAppear()
                }
            }
        }
    }
}

//#Preview {
//    let container = AppDependencyContainer.mock
//    PhotoFeedView(viewModel: container.makePhotoFeedViewModel() )
//}
