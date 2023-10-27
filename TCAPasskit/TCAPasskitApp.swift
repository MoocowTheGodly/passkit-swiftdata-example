//
//  TCAPasskitApp.swift
//  TCAPasskit
//
//  Created by Austin Anaya on 10/26/23.
//

import SwiftUI
import SwiftData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TCAPasskitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            MasterView()
        }
        .modelContainer(for: [User.self, Auth.self])
    }
}
