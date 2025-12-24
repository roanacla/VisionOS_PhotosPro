import Foundation

@MainActor
@Observable
class PhotoFeedViewModel {
    let networkService: NetworkServiceProtocol
    var errorMessage: String?
    var isLoading = false
    var photos: [Photo] = []
    
    init(networkService: NetworkServiceProtocol, errorMessage: String? = nil, isLoading: Bool = false) {
        self.networkService = networkService
        self.errorMessage = errorMessage
        self.isLoading = isLoading
    }
    
    func fetchPhotos() async {
        do {
            // Fixme: replace with valid URL from unsplash
            guard let url = URL(string: APIEndpoint.photos.rawValue) else { throw NetworkError.invalidURL }
            let urlRequest = URLRequest(url: url)
            photos = try await networkService.fetch(from: urlRequest)
        } catch let error as NetworkError {
            switch error {
            case .invalidURL:
                errorMessage = String(localized: "Invalid URL")
            case .invalidResponse:
                errorMessage = String(localized: "Invalid response")
            case .decodingError:
                errorMessage = String(localized: "Decoding error")
            case .serverError(let statusCode):
                switch statusCode {
                case (300...399):
                    errorMessage = String(localized: "Redirection error")
                case (400...499):
                    errorMessage = String(localized: "Client error")
                case (500...599):
                    errorMessage = String(localized: "Server error")
                default:
                    errorMessage = String(localized: "Unknown error")
                }
            }
        } catch {
            errorMessage = String(localized: "Unknown error")
        }
    }
    
}
