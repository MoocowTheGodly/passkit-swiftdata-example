//
// Created by Austin Anaya on 10/27/23
//

import SwiftData
import SwiftUI

@Model
class User: UserModel, ObservableObject, Hashable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String

    init(id: String = UUID().uuidString, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}

@MainActor
protocol UserModel: ObservableObject, Identifiable {
    var id: String { get set }
    var firstName: String { get set }
    var lastName: String { get set }
}
