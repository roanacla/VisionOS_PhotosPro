import Foundation
import UIKit

@MainActor
@Observable
class RemoteImageViewModel {
    @ObservationIgnored private let imageURL: String
    @ObservationIgnored private let networkService: NetworkServiceProtocol
    @ObservationIgnored private let imageLoaderService: ImageLoaderServiceProtocol
    
    var imageData: Data?
    
    init(imageURL: String, networkService: NetworkServiceProtocol, imageLoaderService: ImageLoaderServiceProtocol) {
        self.imageURL = imageURL
        self.networkService = networkService
        self.imageLoaderService = imageLoaderService
    }
    
    func fetchImage() async {
        guard let imageURL = URL(string: imageURL) else {
            print("Invalid image URL")
            return
        }
        // Search in cache
        if let cachedImage = await imageLoaderService.retrieve(forKey: imageURL.absoluteString) {
            imageData = cachedImage
        // Make network request
        } else {
            do {
                let imageData: Data = try await networkService.fetchImage(from: imageURL)
                self.imageData = imageData
                await imageLoaderService.store(data: imageData, forKey: imageURL.absoluteString)
            } catch {
                print("Error fetching image")
            }
        }
    }
}
