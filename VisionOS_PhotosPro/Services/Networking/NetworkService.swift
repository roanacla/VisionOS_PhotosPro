import Foundation

class NetworkService: NetworkServiceProtocol {
    let session: URLSession
    let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func fetch<T: Decodable & Sendable>(from request: URLRequest) async throws -> T {
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        let status = httpResponse.statusCode
        
        guard (200...299).contains(status) else {
            throw NetworkError.serverError(status)
        }
        do {
            let decodedObject = try decoder.decode(T.self, from: data)
            return decodedObject
        } catch {
            throw NetworkError.decodingError
        }
    }
}
