//
// Created by Austin Anaya on 10/27/23
//

import Foundation
import SwiftUI

// The main navigation controller.

final class Router: ObservableObject {

    public enum Route: Codable, Hashable {
        case loginView
    }

    @Published var navPath = NavigationPath()

    func navigate(to destination: Route) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
