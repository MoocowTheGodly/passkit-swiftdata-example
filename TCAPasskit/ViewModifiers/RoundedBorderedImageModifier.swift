//
// Created by Austin Anaya on 11/12/23
//

import SwiftUI

struct RoundedBorderedImageModifier: ViewModifier {
    var contentMode: ContentMode

    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: contentMode)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.lightGray, lineWidth: 2))
    }
}
