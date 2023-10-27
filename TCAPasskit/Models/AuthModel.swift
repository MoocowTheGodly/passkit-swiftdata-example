//
// Created by Austin Anaya on 10/27/23
//

import SwiftData
import SwiftUI

@Model
class Auth: AuthModel, ObservableObject, Hashable {
    var id: String
    var expirationDate: Date

    init(id: String = UUID().uuidString, expirationDate: Date) {
        self.id = id
        self.expirationDate = expirationDate
    }

    var hasExpired: Bool = false
}

protocol AuthModel: ObservableObject, Identifiable {
    var id: String { get set }
    var expirationDate: Date { get set }
}
