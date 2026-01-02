import SwiftUI
import UIKit

struct ThumbnailImageView: View {
    @State var viewModel: RemoteImageViewModel
    
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
        .frame(width: 100, height: 100)
        .task {
            await viewModel.fetchImage()
        }
    }
}
