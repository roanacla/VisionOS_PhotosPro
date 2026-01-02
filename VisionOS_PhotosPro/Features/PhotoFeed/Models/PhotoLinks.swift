import Foundation

struct PhotoLinks: Codable, Hashable {
    let selfLink: String
    let html: String
    let download: String
    let downloadLocation: String
    
    enum CodingKeys: String, CodingKey {
        case html, download
        case selfLink = "self"
        case downloadLocation = "download_location"
    }
}
