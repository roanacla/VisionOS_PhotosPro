import Foundation
import UIKit

@MainActor
@Observable
class RemoteImageViewModel {
    private let imageURL: URL?
    private let networkService: NetworkServiceProtocol
    
    var imageData: Data?
    
    init(url: URL?, networkService: NetworkServiceProtocol) {
        self.imageURL = url
        self.networkService = networkService
    }
    
    func fetchImage() async {
        guard let imageURL else {
            print("No image URL")
            return
        }
        if let cachedImage = await ImageLoaderService.shared.retrieve(forKey: imageURL.absoluteString) {
            imageData = cachedImage
        } else { // make network request
            do {
                let imageData: Data = try await networkService.fetchImage(from: imageURL)
                self.imageData = imageData
                await ImageLoaderService.shared.store(data: imageData, forKey: imageURL.absoluteString)
            } catch {
                print("Error fetching image")
            }
        }
    }
}
