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
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
            }
            .environmentObject(router)
            .environmentObject(userAGModel)
            .onAppear {
                UITabBar.appearance().backgroundColor = UIColor.lightGray
            }
            // for every screen, this switch statement needs to deal with additional enums placed Router.Destination (every full screen, basically)
            .navigationDestination(for: Router.Route.self) { destination in
                switch destination {
                case .loginView:
                    LoginView()
                        .environmentObject(userAGModel)

                }
            }
        }
//        .onReceive(timer) { _ in
//            let date = Date()
//            if let auth, date > auth.expirationDate, auth.hasExpired == false {
//                auth.hasExpired = true
//                print("saving new auth")
//                try? context.save()
//            }
//        }

//        .onChange(of: user) {
//            print("checking user")
//            guard let id = user?.id else { return }
////            fetchAuth(for: id)
//        }

//        .onChange(of: auth?.hasExpired) {
//            guard user != nil, let auth else { return }
//            print("auth has expired")
//            showAuthExpiredAlert = auth.hasExpired
//        }
        
//        .sheet(isPresented: $showAuthExpiredAlert) {
//            Text("Auth has expired!")
//                .foregroundStyle(.red)
//                .font(.title3)
//        }
    }
}

extension MasterView {
//    func fetchAuth(for id: String) {
//        Firestore.firestore().collection("auth").document(id).addSnapshotListener { (snapshot, error) in
//            guard let snapshot else {
//                print("no auth docs found")
//                return
//            }
//
//            guard let data = snapshot.data() else { return }
//            let expirationDate = data["expirationDate"] as? Timestamp ?? Timestamp()
//            let id = data["id"] as? String ?? ""
//
//            if let auth {
//                auths[0].expirationDate = expirationDate.dateValue()
//                auths[0].id = id
//                try? context.save()
//            } else {
//                let auth = Auth(id: id, expirationDate: expirationDate.dateValue())
//                context.insert(auth)
//            }
//        }
//    }

    func fetchCGAuth() {
        
    }
}
