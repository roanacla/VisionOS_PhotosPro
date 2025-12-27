import Foundation
import UIKit

protocol ImageLoaderServiceProtocol {
    func store(data: Data, forKey: String) async
    func retrieve(forKey: String) async -> Data?
}

