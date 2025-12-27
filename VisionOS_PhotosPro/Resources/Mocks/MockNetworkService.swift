import Foundation
import UIKit

public class MockNetworkService: NetworkServiceProtocol {
    func fetchImage(from url: URL) async throws -> Data {
        UIImage(named: "sun.max")?.pngData() ?? Data()
    }
    
    typealias DecodableType = [Photo]
    private var photos: [Photo] = [.init(id: "image 1", createdAt: "", updatedAt: "", width: 800, height: 800, color: nil, blurHash: nil, description: nil, urls: .init(raw: "", full: "", regular: "", small: "", thumb: ""), links: .init(selfLink: "", html: "", download: "", downloadLocation: "")),
                                   .init(id: "image 2", createdAt: "", updatedAt: "", width: 800, height: 800, color: nil, blurHash: nil, description: nil, urls: .init(raw: "", full: "", regular: "", small: "", thumb: ""), links: .init(selfLink: "", html: "", download: "", downloadLocation: "")),
                                   .init(id: "image 3", createdAt: "", updatedAt: "", width: 800, height: 800, color: nil, blurHash: nil, description: nil, urls: .init(raw: "", full: "", regular: "", small: "", thumb: ""), links: .init(selfLink: "", html: "", download: "", downloadLocation: "")),
                                   .init(id: "image 4", createdAt: "", updatedAt: "", width: 800, height: 800, color: nil, blurHash: nil, description: nil, urls: .init(raw: "", full: "", regular: "", small: "", thumb: ""), links: .init(selfLink: "", html: "", download: "", downloadLocation: ""))]
    public var fetchClosure: (() throws -> Void)?
    
    public func fetch<T>(from request: URLRequest) async throws -> T where T : Decodable {
        try fetchClosure?()
        guard let result = photos as? T else {
            throw MockError.typeMisMatch
        }
        
        return result
    }
}
