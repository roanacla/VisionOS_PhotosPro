import Foundation

struct Photo: Codable, Identifiable {
    let id: String
    let createdAt: String
    let updatedAt: String
    let width: Int
    let height: Int
    let color: String?
    let blurHash: String?
    let description: String?
//    let user: User
//    let currentUserCollections: [Collection]
    let urls: PhotoURLs
    let links: PhotoLinks
    
    // Mapping JSON keys (snake_case) to Swift properties (camelCase)
    enum CodingKeys: String, CodingKey {
//        case id, width, height, color, description, user, urls, links
        case id, width, height, color, description, urls, links
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case blurHash = "blur_hash"
//        case currentUserCollections = "current_user_collections"
    }
}
