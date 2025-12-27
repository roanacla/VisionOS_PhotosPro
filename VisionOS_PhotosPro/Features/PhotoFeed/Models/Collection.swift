import Foundation

struct Collection: Codable, Identifiable {
    let id: Int
    let title: String
    let publishedAt: String?
    let lastCollectedAt: String?
    let updatedAt: String?
    let coverPhoto: Photo? // Recursive reference is allowed in structs if optional
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case id, title, user
        case publishedAt = "published_at"
        case lastCollectedAt = "last_collected_at"
        case updatedAt = "updated_at"
        case coverPhoto = "cover_photo"
    }
}
