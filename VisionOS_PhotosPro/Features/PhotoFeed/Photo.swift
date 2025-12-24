import Foundation

struct Photo: Identifiable, Decodable, Sendable {
    var id = UUID()
    var title: String = ""
    //TODO: add the necessary properties to represent the returned objects from the remote API
}
