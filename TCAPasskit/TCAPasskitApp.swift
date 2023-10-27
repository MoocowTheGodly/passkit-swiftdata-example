//
//  TCAPasskitApp.swift
//  TCAPasskit
//
//  Created by Austin Anaya on 10/26/23.
//

import SwiftUI
import SwiftData

@main
struct TCAPasskitApp: App {
    var body: some Scene {
        WindowGroup {
            MasterView()
        }
        .modelContainer(for: User.self)
    }
}
