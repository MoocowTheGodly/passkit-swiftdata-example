//
// Created by Austin Anaya on 10/26/23
//

import SwiftUI
import SwiftData
import FirebaseFirestore

@MainActor
struct LoginView: View {
    @Environment(\.modelContext) private var context

    @Query private var users: [User]
    var user: User? { users.first }

    var body: some View {
        Text("This is the login page!")
        if let user {
            Text("User is logged in!")
            Text("User name: \(user.firstName) \(user.lastName)")

//            if user.authHasExpired {
//                Text("Auth has expired :(")
//                    .foregroundStyle(.red)
//            }
        } else {
            Button {
                fetchUser()
            } label: {
                Text("Add a user (Emulate login)")
            }
        }
    }
}

extension LoginView {
    func fetchUser() {
        Firestore.firestore().collection("user").document("zMU32rv8S3t60KAqX55G").addSnapshotListener { (snapshot, error) in
            guard let snapshot else {
                print("no docs found")
                return
            }

            guard let data = snapshot.data() else { return }
            let firstName = data["firstName"] as? String ?? ""
            let lastName = data["lastName"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let id = snapshot.documentID

            if let user {
                users[0].firstName = firstName
                users[0].lastName = lastName
                users[0].email = email
                users[0].id = id
                try? context.save()
            } else {
                let user = User(id: id, firstName: firstName, lastName: lastName, email: email)
                print("adding user: \(user)")
                context.insert(user)
            }
        }
    }
}

