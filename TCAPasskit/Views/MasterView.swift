//
// Created by Austin Anaya on 10/26/23
//

import SwiftUI
import SwiftData
import Combine
import FirebaseFirestore

struct MasterView: View {
    @ObservedObject var router = Router()
    @Environment(\.modelContext) private var context

    var userAGModel = UserAGModel()

//    @Query private var users: [User]
//    var user: User? { users.first }
//
//    @Query private var auths: [Auth]
//    var auth: Auth? { auths.first }

    var body: some View {
        NavigationStack(path: $router.navPath) {
            TabView {
                HomeScreen()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
            }
            .environmentObject(router)
            .environmentObject(userAGModel)
            .navigationBarBackButtonHidden()
            .onAppear {
                UITabBar.appearance().backgroundColor = UIColor.lightGray
            }
            // for every screen, this switch statement needs to deal with additional enums placed Router.Destination (every full screen, basically)
            .navigationDestination(for: Router.Route.self) { destination in
                Group {
                    switch destination {
                    case .loginView:
                        LoginScreen()
                            .environmentObject(userAGModel)
                            .navigationBarBackButtonHidden()
                    }
                }
                .environmentObject(router)
            }
        }
    }
}
