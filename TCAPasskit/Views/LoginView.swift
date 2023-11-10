//
// Created by Austin Anaya on 10/26/23
//

import SwiftUI
import SwiftData
import FirebaseFirestore

@MainActor
struct LoginView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var userModel: UserAGModel

    @Query private var savedUsers: [PersistentUser]
    var savedUser: PersistentUser? { savedUsers.first }

    @Query private var savedAuths: [PersistentKeanuAuth]
    var savedAuth: PersistentKeanuAuth? { savedAuths.first }

    @FocusState var focusedField: FocusedField?
    @State private var email: String = ""
    @State private var password: String = ""
    @State var showPassword = false

    var body: some View {
        VStack(alignment: .center) {
            Text("This is the login page!")
            Spacer()
            if let savedUser {
                loggedInView(savedUser)
            } else {
                loggedOutView
            }
            Spacer()
        }
        .onReceive(userModel.$user) { user in
            saveUser(user)
        }
        .onReceive(userModel.$auth) { auth in
            saveAuth(auth)
        }
    }
}

// MARK: - ViewComponents

extension LoginView {
    private func loggedInView(_ savedUser: PersistentUser) -> some View {
        Group {
            Text("Logged in user: \(savedUser.firstName) \(savedUser.lastName)")
            Button {
                logout()
            } label: {
                Text("Log out")
            }
        }
    }

    private var loggedOutView: some View {
        VStack(alignment: .center, spacing: 20) {
            emailField
            passwordField

            Button {
                login()
            } label: {
                Text("Login")
            }
        }
        .padding(.horizontal, 40)
    }

    private var emailField: some View {
        TextField("email", text: $email)
            .textContentType(.username)
            .keyboardType(.emailAddress)
            .submitLabel(.next)
            .focused($focusedField, equals: .email)
    }

    private var passwordField: some View {
        ZStack(alignment: .trailing) {
            TextField("password", text: $password)
                .focused($focusedField, equals: .passwordShown)
                .opacity(showPassword ? 1 : 0)
                .textContentType(.password)

            SecureField("password", text: $password)
                .focused($focusedField, equals: .passwordHidden)
                .opacity(showPassword ? 0 : 1)
                .textContentType(.password)

            Button(action: {
                showPassword.toggle()
                focusedField = showPassword ? .passwordShown : .passwordHidden
            }, label: {
                Image(systemName: showPassword ? "eye" : "eye.slash")
            })
        }
        .submitLabel(.go)
    }
}

// MARK: - ViewBehaviors

extension LoginView {
    func login() {
        Task {
            let authRequest = KeanuAuthRequest(email: email, password: password)
            try await userModel.login(request: authRequest)
            try await userModel.fetchUser(email: email)
        }
    }

    func logout() {
        Task {
            userModel.logout()
            try context.delete(model: PersistentUser.self)
            try context.delete(model: PersistentKeanuAuth.self)
        }
    }

    func saveUser(_ user: User?) {
        print("user before cast: \(user)")
        guard let persistentUser = user?.asPersistentData() else { return }

        if savedUser != nil {
            savedUsers[0].id = persistentUser.id
            savedUsers[0].firstName = persistentUser.firstName
            savedUsers[0].lastName = persistentUser.lastName
        } else {
            context.insert(persistentUser)
        }
    }

    func saveAuth(_ auth: KeanuAuth?) {
        print("auth before cast: \(auth)")
        guard let persistentAuth = auth?.asPersistentData() else { return }

        if savedAuth != nil {
            savedAuths[0].refreshtoken = persistentAuth.refreshtoken
            savedAuths[0].token = persistentAuth.token
        } else {
            context.insert(persistentAuth)
        }
    }
}

// MARK: - Other

extension LoginView {
    enum FocusedField: Hashable {
        case email
        case passwordShown
        case passwordHidden
    }
}

