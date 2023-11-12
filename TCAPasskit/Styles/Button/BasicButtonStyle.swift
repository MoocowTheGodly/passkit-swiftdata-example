//
// Created by Austin Anaya on 11/12/23
//

import SwiftUI

struct BasicButtonStyle: ButtonStyle {
    var normalColor: Color = .darkGray
    var selectedColor: Color = .pavement.opacity(0.1)

    func makeBody(configuration: Configuration) -> some View {
        let backgroundColor: Color = configuration.isPressed ? selectedColor : .clear

        configuration.label
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
            .contentShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
    }
}
