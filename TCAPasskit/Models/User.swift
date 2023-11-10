//
// Created by Austin Anaya on 10/27/23
//

import SwiftData
import SwiftUI

//@Model
//class User: UserModel, ObservableObject, Hashable {
//    var id: String
//    var firstName: String
//    var lastName: String
//    var email: String
//
//    init(id: String = UUID().uuidString, firstName: String, lastName: String, email: String) {
//        self.id = id
//        self.firstName = firstName
//        self.lastName = lastName
//        self.email = email
//    }
//}
//
//@MainActor
//protocol UserModel: ObservableObject, Identifiable {
//    var id: String { get set }
//    var firstName: String { get set }
//    var lastName: String { get set }
//}

@Model
class PersistentUser: ObservableObject, Hashable {
    var id: String
    var firstName: String
    var lastName: String

    init(id: String, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }

    static func generate() -> User {
        return User(id: "1234", firstName: "Yee", lastName: "Haw")
    }
}

struct User: Codable, Identifiable, Hashable {
    let id: String
    let firstName: String
    let lastName: String

    func asPersistentData() -> PersistentUser {
        return PersistentUser(id: id, firstName: firstName, lastName: lastName)
    }

    static func generate() -> User {
        return User(id: "1234", firstName: "Yee", lastName: "Haw")
    }
}
