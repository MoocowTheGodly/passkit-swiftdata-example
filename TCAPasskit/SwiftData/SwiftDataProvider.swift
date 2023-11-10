//
// Created by Austin Anaya on 11/10/23
//

import Foundation
import SwiftData

class SwiftDataProvider {
    static let shared = SwiftDataProvider()

    let container = try! ModelContainer(for: PersistentUser.self, PersistentKeanuAuth.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))

    @MainActor
    var context: ModelContext {
        container.mainContext
    }
}
