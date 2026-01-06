import SwiftUI

struct PhotoFeedView: View {
    @State var viewModel: PhotoFeedViewModel
    // 1. Consume the new feature from the Environment
    // We don't need to pass this in the init; it's just "there".
    @Environment(\.displaySettings) var settings
    
    // 2. Computed grid layout based on environment settings
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: settings.density.minItemSize), spacing: 10)]
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Array(viewModel.photos.enumerated()), id: \.element.id) { index, photo in
                    Button {
                        viewModel.navigationRouter.navigate(to: .detail(photo))
                    } label: {
                        let url = settings.density == .compact ? photo.urls.thumb : photo.urls.small
                        ThumbnailImageView(viewModel: viewModel.makeRemoteImageViewModel(url))
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
            .padding(.horizontal)
            // 3. Animation: This ensures the grid smoothly resizes when density changes
            .animation(.default, value: settings.density)
            .searchable(text: $viewModel.searchText)
            .task(id: viewModel.searchText) {
                await viewModel.searchPhotosWithDebouncing()
            }
            .task {
                await viewModel.onViewAppear()
            }
        }
        .navigationTitle("Photos Pro")
        .toolbar {
            // 3. Control for the new feature
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Picker("Density", selection: Bindable(settings).density) {
                        ForEach(DisplaySettings.GridDensity.allCases) { density in
                            Text(density.rawValue).tag(density)
                        }
                    }
                } label: {
                    Label("Layout", systemImage: "square.grid.2x2")
                }
            }
        }
        
    }
}

#Preview {
    let container = AppDependencyContainer.mock
    NavigationStack {
        PhotoFeedView(viewModel: container.makePhotoFeedViewModel(router: NavigationRouter()))
    }
    .environment(DisplaySettings())
}
