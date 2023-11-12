//
// Created by Austin Anaya on 11/12/23
//

import SwiftUI

struct NavArrow: View {
    enum Direction {
        case right
        case left
    }

    var direction: Direction = .right

    var body: some View {
        switch direction {
        case .right:
            Image(systemName: "chevron.forward")
                .foregroundColor(.textGray)
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)

        case .left:
            Image(systemName: "chevron.backward")
                .foregroundColor(.textGray)
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
    }
}
