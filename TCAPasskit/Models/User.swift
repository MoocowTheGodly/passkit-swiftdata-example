//
// Created by Austin Anaya on 10/27/23
//

import SwiftData
import SwiftUI

@Model
class PersistentUser: ObservableObject, Hashable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String

    init(id: String, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}

struct User: Codable, Identifiable, Hashable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String

    func asPersistentData() -> PersistentUser {
        return PersistentUser(id: id, firstName: firstName, lastName: lastName, email: email)
    }
}
