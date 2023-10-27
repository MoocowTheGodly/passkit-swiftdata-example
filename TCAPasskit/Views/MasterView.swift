//
// Created by Austin Anaya on 10/26/23
//

import SwiftUI
import SwiftData
import Combine

struct MasterView: View {
    @ObservedObject var router = Router()
    @Environment(\.modelContext) private var context

    @Query private var users: [User]
    var user: User? { users.first }

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack(path: $router.navPath) {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .environmentObject(router)
                TicketsView()
                    .tabItem {
                        Label("Tickets", systemImage: "ticket.fill")
                    }
            }
            .onAppear {
                UITabBar.appearance().backgroundColor = UIColor.lightGray
            }
            // for every screen, this switch statement needs to deal with additional enums placed Router.Destination (every full screen, basically)
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .loginView: LoginView()
                }
            }
        }
        .onReceive(timer) { _ in
            if let user, Date() > user.authExpiration {
                user.authHasExpired = true
                try? context.save()
            }
        }
    }
}
