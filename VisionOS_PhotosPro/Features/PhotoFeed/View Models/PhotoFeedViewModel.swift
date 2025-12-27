import Foundation

@MainActor
@Observable
class PhotoFeedViewModel {
    let networkService: NetworkServiceProtocol
    var errorMessage: String?
    var isLoading = false
    var photos: [Photo] = []
    private var page = 1
    private var isFetching = false
    private let maxPages = 10 //FIXME: Add this in a xcconfig file
    
    init(networkService: NetworkServiceProtocol, errorMessage: String? = nil, isLoading: Bool = false) {
        self.networkService = networkService
        self.errorMessage = errorMessage
        self.isLoading = isLoading
    }
    
    func fetchPhotos() async {
        guard isFetching == false && page <= maxPages else { return }
        isFetching = true
        do {
            let factory = UnsplashRequestFactory()
            guard let photoRequest = factory.makeRequest(endpoint: .photos(page: page)) else {
                throw NetworkError.invalidURL
            }
            let newPhotos: [Photo] = try await networkService.fetch(from: photoRequest)
            photos.append(contentsOf: newPhotos)
            isFetching = false
            page += 1
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
            isFetching = false
        } catch {
            errorMessage = String(localized: "Unknown error")
            isFetching = false
        }
    }
    
}
