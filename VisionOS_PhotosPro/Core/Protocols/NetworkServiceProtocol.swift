import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(from request: URLRequest) async throws -> T
    func fetchImage(from url: URL) async throws -> Data
}
