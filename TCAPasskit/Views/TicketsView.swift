//
// Created by Austin Anaya on 10/27/23
//

import Foundation
import SwiftUI
import SwiftData

struct TicketsView: View {
    @Query private var users: [User]
    var user: User? { users.first }

    var body: some View {
        VStack {
            Text("This is the tickets view!")

            if let user {
                Text("User is logged in!")

//                if user.authHasExpired {
//                    Text("Auth has expired :(")
//                        .foregroundStyle(.red)
//                }
            } else {
                Text("User is logged out :(")
            }
        }
    }
}
