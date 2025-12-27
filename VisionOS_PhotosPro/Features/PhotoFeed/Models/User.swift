import Foundation

struct User: Codable, Identifiable {
    let id: String
    let username: String
    let name: String
    let portfolioURL: String?
    let bio: String?
    let location: String?
    let totalCollections: Int
    let instagramUsername: String?
    let twitterUsername: String?
    let profileImage: ProfileImage
    let links: UserLinks

    enum CodingKeys: String, CodingKey {
        case id, username, name, bio, location, links
        case portfolioURL = "portfolio_url"
        case totalCollections = "total_collections"
        case instagramUsername = "instagram_username"
        case twitterUsername = "twitter_username"
        case profileImage = "profile_image"
    }
}
