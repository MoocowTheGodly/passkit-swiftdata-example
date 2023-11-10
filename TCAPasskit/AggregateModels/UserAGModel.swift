//
// Created by Austin Anaya on 11/9/23
//

import Foundation

@MainActor
class UserAGModel: ObservableObject {
    @Published private(set) var user: User?
    @Published private(set) var auth: KeanuAuth?

    let userService: NetworkingService = .shared

    func fetchUser(userId: String) async throws {
//        user = try await UserService.shared.fetchUserInfo(id: "")
        user = try await userService.load(Resource(url: .userByUserId(userId)))
    }

    func fetchUser(email: String) async throws {
//        user = try await UserService.shared.fetchUserInfo(id: "")
//        let resource = Resource(url: .userService)
        user = try await userService.load(
            Resource(url: .userService, method: .get([.init(name: "email", value: email)]))
        )
    }

    func login(request: KeanuAuthRequest) async throws {
        let data = try JSONEncoder().encode(request)
        auth = try await userService.load(
            Resource(url: .authService, method: .post(data))
        )
    }

    func logout() {
        user = nil
        auth = nil
    }
}
