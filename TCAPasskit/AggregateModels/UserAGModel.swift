//
// Created by Austin Anaya on 11/9/23
//

import Foundation

@MainActor
class UserAGModel: ObservableObject {
    @Published private(set) var user: User?
    @Published private(set) var auth: KeanuAuth?
    @Published private(set) var userSubscriptions: [UserSubscription]?

    let networkingService: NetworkingService = .shared

    func fetchSubscriptions(userId: String) async throws {
        let response: UserSubscriptionResponse = try await networkingService.load(
            Resource(url: .subscriptionsByUserId(userId))
        )
        userSubscriptions = response.content
    }

    func fetchUser(email: String) async throws {
        user = try await networkingService.load(
            Resource(url: .userService, method: .get([.init(name: "email", value: email)]))
        )
    }

    func login(request: KeanuAuthRequest) async throws {
        let data = try JSONEncoder().encode(request)
        auth = try await networkingService.load(
            Resource(url: .authService, method: .post(data))
        )
    }

    func logout() {
        user = nil
        auth = nil
    }
}
