import Foundation
import SwiftUI

@MainActor
@Observable
class NavigationRouter: NavigationRouterProtocol {
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
