//
// Created by Austin Anaya on 10/26/23
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var context

    @Query private var users: [User]
    var user: User? { users.first }

    var body: some View {
        Text("This is the login page!")
        if let user {
            Text("User is logged in!")

            if user.authHasExpired {
                Text("Auth has expired :(")
                    .foregroundStyle(.red)
            }
        } else {
            Button {
                let user = User(name: "Yee Haw")
                // incredibly easy SwiftData operators
                context.insert(user)
            } label: {
                Text("Add a user (Emulate login)")
            }
        }
    }
}
