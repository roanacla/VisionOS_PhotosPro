import Foundation

protocol NavigationRouterProtocol: AnyObject {
    func navigate(to destination: AppDestination)
    func pop()
}

enum AppDestination: Hashable {
    case detail(Photo)
}
