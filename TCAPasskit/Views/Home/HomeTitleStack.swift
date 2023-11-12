//
// Created by Austin Anaya on 11/12/23
//

import SwiftUI

struct HomeTitleStack: View {
    @EnvironmentObject var router: Router

    var savedUser: PersistentUser?

    var body: some View {
        HStack {
            if let savedUser {
                Button {
                    router.navigate(to: .loginView)
                } label: {
                    HStack(spacing: 4) {
                        profileButton(imageURL: savedUser.imageURL ?? "")

                        VStack(alignment: .leading) {
                            Text("WELCOME")
                                .font(.Paragraph.Bold.tiny)
                                .kerning(7)

                            Text("\(savedUser.firstName.uppercased())")
                                .font(.Paragraph.Bold.large)
                                .kerning(3.4)
                                .minimumScaleFactor(0.55)
                                .truncationMode(.tail)
                        }
                        .padding(.leading, 2)

                        NavArrow()
                    }
                }
                .buttonStyle(BasicButtonStyle())
            } else {
                Button {
                    router.navigate(to: .loginView)
                } label: {
                    HStack(spacing: 4) {
                        userIcon
                            .modifier(RoundedBorderedImageModifier(contentMode: .fill))

                        VStack(alignment: .leading) {
                            Text("PLEASE")
                                .font(.Paragraph.Bold.tiny)
                                .kerning(7)

                            Text("LOGIN")
                                .font(.Paragraph.Bold.large)
                                .kerning(3.4)
                                .minimumScaleFactor(0.55)
                                .truncationMode(.tail)
                        }
                        .padding(.leading, 2)

                        NavArrow()
                    }
                }
                .buttonStyle(BasicButtonStyle())
            }

            Spacer()
        }
    }
}

extension HomeTitleStack {
    func profileButton(imageURL: String) -> some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            userIcon
        }
        .frame(width: 40, height: 40)
        .modifier(RoundedBorderedImageModifier(contentMode: .fit))
    }

    var userIcon: some View {
        Image(decorative: "user_icon")
            .resizable()
            .frame(width: 20, height: 20)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
    }
}
