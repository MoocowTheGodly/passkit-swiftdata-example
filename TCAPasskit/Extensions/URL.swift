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

    static var userService: URL {
        URL(string: "/user/v1/users", relativeTo: Self.default)!
    }

    static var authService: URL {
        URL(string: "/auth/v1/authentications", relativeTo: Self.default)!
    }

    static var billingService: URL {
        URL(string: "/billing/v1", relativeTo: Self.default)!
    }

    static func userByUserId(_ userId: String) -> URL {
        userService.appendingPathComponent(userId)
    }

    static func subscriptionsByUserId(_ userId: String) -> URL {
        billingService.appendingPathComponent("users/\(userId)/subscriptions")
    }
}
