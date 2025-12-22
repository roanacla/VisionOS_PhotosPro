import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(from request: URLRequest, objectsOfType: T.Type) async throws -> T
}
