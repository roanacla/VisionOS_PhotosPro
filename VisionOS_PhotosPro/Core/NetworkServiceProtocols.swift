import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(from request: URLRequest) async throws -> T
}
