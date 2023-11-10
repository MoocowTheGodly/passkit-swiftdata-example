//
// Created by Austin Anaya on 10/27/23
//

import SwiftData
import SwiftUI

//protocol KeanuAuthModel: ObservableObject, Identifiable {
//    var token: String { get set }
//    var refreshtoken: String { get set }
//}

@Model
class PersistentKeanuAuth: ObservableObject, Hashable {
    var token: String
    var refreshtoken: String

    init(token: String, refreshtoken: String) {
        self.token = token
        self.refreshtoken = refreshtoken
    }
}

struct KeanuAuth: Codable, Hashable {
    let token: String
    let refreshToken: String

    func asPersistentData() -> PersistentKeanuAuth {
        return PersistentKeanuAuth(token: token, refreshtoken: refreshToken)
    }
}

//@Model
//class KeanuAuth: Codable, Hashable, ObservableObject {
//    let token: String
//    let refreshToken: String
//
//    init(token: String, refreshToken: String) {
//        self.token = token
//        self.refreshToken = refreshToken
//    }
//}
