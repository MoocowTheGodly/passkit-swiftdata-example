//
// Created by Austin Anaya on 10/27/23
//

import Foundation
import SwiftUI

// The main navigation controller.

final class Router: ObservableObject {

    public enum Destination: Codable, Hashable {
        case loginView
    }

    @Published var navPath = NavigationPath()

    func navigate(to destination: Destination) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
