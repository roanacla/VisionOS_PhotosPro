import Foundation

// MARK: - URLRequestFactory Protocol
/// Defines the interface for creating URLRequests.
/// This abstraction allows for different implementations of request creation logic.
protocol URLRequestFactory {
    func makeRequest(endpoint: Endpoint) -> URLRequest?
}

// MARK: - Endpoint Definition
/// Represents the distinct endpoints available in the API.
/// This decouples the factory from raw strings.
enum Endpoint {
    case photos(page: Int)
    case search(query: String)
}

// MARK: - Concrete Factory
/// A specific factory implementation for the Unsplash API.
/// This class handles the specific logic for constructing Unsplash requests,
/// including the base URL and authorization headers.
struct UnsplashRequestFactory: URLRequestFactory {
    
    private let accessKey: String
    private let baseURL = "https://api.unsplash.com"
    
    init(accessKey: String? = nil) {
        if accessKey == nil {
            guard let key = Bundle.main.object(forInfoDictionaryKey: "UnsplashAccessKey") as? String else {
                fatalError("Access key is missing")
            }
            self.accessKey = key
        } else {
            self.accessKey = accessKey ?? ""
        }
    }
    
    func makeRequest(endpoint: Endpoint) -> URLRequest? {
        // 1. Determine the path and query items based on the endpoint case
        var path = ""
        var queryItems: [URLQueryItem] = []
        
        switch endpoint {
        case .photos(let page):
            path = "/photos"
            queryItems = [URLQueryItem(name: "page", value: String(page))]
            
        case .search(let query):
            path = "/search/photos"
            queryItems = [URLQueryItem(name: "query", value: query)]
        }
        
        // 2. Construct the URLComponents
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            return nil
        }
        
        // 3. Create and configure the URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Apply the authorization header centrally
        request.setValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
