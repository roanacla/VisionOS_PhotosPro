import SwiftUI

struct PhotoDetailView: View {
    @State var viewModel: RemoteImageViewModel
    
    
    var body: some View {
        VStack(alignment: .center) {
            if let image = viewModel.imageData, let uiImage = UIImage(data: image) {
                Image.init(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .task {
            await viewModel.fetchImage()
        }
        
    }
}
