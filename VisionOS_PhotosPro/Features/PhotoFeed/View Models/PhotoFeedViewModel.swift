import Foundation

@MainActor
@Observable
class PhotoFeedViewModel {
    @ObservationIgnored let networkService: NetworkServiceProtocol
    @ObservationIgnored let analyticsService: AnalyticsServiceProtocol
    
    var errorMessage: String?
    var isLoading = false
    var photos: [Photo] = []
    var searchText: String = ""
    var makeRemoteImageViewModel: (String) -> RemoteImageViewModel
    var navigationRouter: NavigationRouter
    
    private var lastSearchText = ""
    private var page = 1
    private var isFetching = false
    private let maxPages = 10 //FIXME: Add this in a xcconfig file
    private var endPoint: Endpoint = .photos(page: 1)
    
    init(analyticsService: AnalyticsServiceProtocol, networkService: NetworkServiceProtocol, errorMessage: String? = nil, isLoading: Bool = false, navigationRouter: NavigationRouter, makeRemoteImageViewModel: @escaping (String) -> RemoteImageViewModel) {
        self.networkService = networkService
        self.analyticsService = analyticsService
        self.errorMessage = errorMessage
        self.isLoading = isLoading
        self.navigationRouter = navigationRouter
        self.makeRemoteImageViewModel = makeRemoteImageViewModel
    }
    
    func searchPhotosWithDebouncing() async {
        guard searchText != lastSearchText else { return }
        lastSearchText = searchText
        if searchText.isEmpty {
            page = 1
            photos = []
            await loadPhotos()
            return
        }
        do {
            try await Task.sleep(for: .seconds(0.5))
            analyticsService.log(event: "Search \(searchText)")
            page = 1
            photos = []
            
            await loadPhotos()
        } catch { }
    }
    
    func loadPhotos() async {
        if searchText.isEmpty {
            endPoint = Endpoint.photos(page: page)
            await fetchPhotos()
        } else {
            endPoint = Endpoint.search(query: searchText, page: page)
            await fetchPhotos()
        }
    }
    
    func onViewAppear() async {
        guard photos.isEmpty || searchText == "" else { return }
        await loadPhotos()
    }
    
    private func fetchPhotos() async {
        guard isFetching == false && page <= maxPages else { return }
        isFetching = true
        do {
            let factory = UnsplashRequestFactory()
            guard let photoRequest = factory.makeRequest(endpoint: endPoint) else {
                throw NetworkError.invalidURL
            }
            switch endPoint {
            case .photos:
                let newPhotos: [Photo] = try await networkService.fetch(from: photoRequest)
                photos.append(contentsOf: newPhotos)
            case .search:
                let searchResult: Search = try await networkService.fetch(from: photoRequest)
                photos.append(contentsOf: searchResult.results)
            }
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
