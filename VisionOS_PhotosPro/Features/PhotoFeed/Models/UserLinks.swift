import Foundation

struct UserLinks: Codable {
    let selfLink: String
    let html: String
    let photos: String
    let portfolio: String?
    
    enum CodingKeys: String, CodingKey {
        case html, photos, portfolio
        case selfLink = "self" // 'self' is a reserved keyword in Swift
    }
}
