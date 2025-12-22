import Foundation

class NetworkService: NetworkServiceProtocol {
    let session: URLSession
    let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    //FIXME: Silence warning: Non-Sendable parameter type 'T.Type' cannot be sent from caller of protocol requirement 'fetch(from:objectsOfType:)' into main actor-isolated implementation; this is an error in the Swift 6 language mode
    func fetch<T: Decodable & Sendable>(from request: URLRequest, objectsOfType: T.Type) async throws -> T {
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
