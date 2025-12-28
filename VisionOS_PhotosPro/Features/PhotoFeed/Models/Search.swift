import Foundation

struct Search: Codable {
    var total: Int
    var totalPages: Int
    var results: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case total, results
        case totalPages = "total_pages"
    }
}
