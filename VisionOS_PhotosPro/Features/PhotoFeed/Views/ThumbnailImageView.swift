import SwiftUI
import UIKit

struct ThumbnailImageView: View {
    @State var viewModel: RemoteImageViewModel
    @Environment(\.displaySettings) private var settings
    
    init(viewModel: RemoteImageViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        Group {
            if let image = viewModel.imageData, let uiImage = UIImage(data: image) {
                Image.init(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
        .frame(width: settings.density.minItemSize, height: settings.density.minItemSize)
        .task {
            await viewModel.fetchImage()
        }
    }
}
