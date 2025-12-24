import Foundation

public class MockNetworkService: NetworkServiceProtocol {
    typealias DecodableType = [Photo]
    private var photos: [Photo] = [.init(title: "Photo 1"),
                                   .init(title: "Photo 2"),
                                   .init(title: "Photo 3"),
                                   .init(title: "Photo 4")]
    public var fetchClosure: (() throws -> Void)?
    
    public func fetch<T>(from request: URLRequest) async throws -> T where T : Decodable {
        try fetchClosure?()
        guard let result = photos as? T else {
            throw MockError.typeMisMatch
        }
        
        return result
    }
}
