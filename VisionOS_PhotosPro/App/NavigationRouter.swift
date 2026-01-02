import Foundation
import SwiftUI

@Observable
class NavigationRouter {
    var path: NavigationPath
    
    init() {
        self.path = NavigationPath()
    }
    
    func navigate(to destination: AppDestination) {
        path.append(destination)
    }
    
    func pop() {
        path.removeLast()
    }
}

enum AppDestination: Hashable {
    case detail(Photo)
}
