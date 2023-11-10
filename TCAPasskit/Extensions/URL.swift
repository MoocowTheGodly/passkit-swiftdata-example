//
// Created by Austin Anaya on 11/9/23
//

import Foundation

extension URL {
    static var staging: URL {
        URL(string: "https://staging.api-gateway.campgladiator.com/")!
    }

    static var production: URL {
        URL(string: "gateway.campgladiator.com/")!
    }

    static var `default`: URL {
        #if DEBUG
            return staging
        #else
            return production
        #endif
    }

    static func userByUserId(_ userId: String) -> URL {
        URL(string: "/user/v1/users/\(userId)", relativeTo: Self.default)!
    }

    static var userService: URL {
        URL(string: "/user/v1/users", relativeTo: Self.default)!
    }

    static var authService: URL {
        URL(string: "/auth/v1/authentications", relativeTo: Self.default)!
    }
}
