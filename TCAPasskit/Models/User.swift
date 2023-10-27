//
// Created by Austin Anaya on 10/27/23
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    var id: String
    var name: String
    var authExpiration: Date
    var authHasExpired: Bool = false

    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
        self.authExpiration = Date().add(amount: 5, type: .second)
    }
}
