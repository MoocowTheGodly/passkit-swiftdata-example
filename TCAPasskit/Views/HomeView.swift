//
//  HomeView.swift
//  TCAPasskit
//
//  Created by Austin Anaya on 10/26/23.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    // environment object needed for all navigation using our Router
    @EnvironmentObject var router: Router
    @EnvironmentObject var userModel: UserAGModel

    // context necessary for handling of SwiftData
    @Environment(\.modelContext) private var context

    // every time we want to access stored objects in SwiftData, we give it @Query. SwiftData handles the rest.
    // it does need to be an array as SwiftData doesn't know if it's an array or not.
//    @Query private var users: [User]

    // so, for a single user, just grab the first in the array
//    var user: User? { users.first }

//    @Query private var auths: [Auth]


    var body: some View {
        VStack {
            Text("this is home screen")

            Button {
                router.navigate(to: .loginView)
            } label: {
                Text("Tap to go to login page")
            }


//            if let user {
//                Text("User is logged in!")
//                Button {
////                    try? context.delete(model: User.self)
////                    try? context.delete(model: Auth.self)
//                } label: {
//                    Text("Log out")
//                }
//            } else {
//                Text("User is logged out :(")
//
//                Button {
//                    router.navigate(to: .loginView)
//                } label: {
//                    Text("Tap to go to login page")
//                }
//            }
        }
    }
}

extension HomeView {
    var loginStack: some View {
        Button {
            router.navigate(to: .loginView)
        } label: {
            Text("Go to login screen")
        }
    }
}
