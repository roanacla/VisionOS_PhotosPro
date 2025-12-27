import SwiftUI
import UIKit

struct RemoteImageView: View {
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
        .task {
            await viewModel.fetchImage()
        }
    }
}
