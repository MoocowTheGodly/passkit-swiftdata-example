//
//  HomeView.swift
//  TCAPasskit
//
//  Created by Austin Anaya on 10/26/23.
//

import SwiftData
import SwiftUI

struct HomeScreen: View {
    // environment object needed for all navigation using our Router
    @EnvironmentObject var router: Router
    @EnvironmentObject var userModel: UserAGModel

    // context necessary for handling of SwiftData
    @Environment(\.modelContext) private var context

    // every time we want to access stored objects in SwiftData, we give it @Query. SwiftData handles the rest.
    // it does need to be an array as SwiftData doesn't know if it's an array or not.
    @Query private var savedUsers: [PersistentUser]
    // so, for a single user, just grab the first in the array
    var savedUser: PersistentUser? { savedUsers.first }

    @Query private var savedAuths: [PersistentKeanuAuth]
    var savedAuth: PersistentKeanuAuth? { savedAuths.first }


    var body: some View {
        VStack {
            HomeTitleStack(savedUser: savedUser)

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
    }
}
