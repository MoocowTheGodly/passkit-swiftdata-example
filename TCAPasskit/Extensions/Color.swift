//
// Created by Austin Anaya on 11/12/23
//

import SwiftUI

extension Color {
    init(hex: UInt) {
        let red = Double((hex >> 16) & 0xFF) / 255
        let green = Double((hex >> 08) & 0xFF) / 255
        let blue = Double((hex >> 00) & 0xFF) / 255
        self.init(.sRGB, red: red, green: green, blue: blue)
    }
}

// MARK: - Grays

public extension Color {
    static var pavement: Color {
        Color(hex: 0x231F20)
    }

    static var textGray: Color {
        Color(hex: 0x99999A)
    }

    static var darkGray: Color {
        Color(hex: 0x333333)
    }

    static var mediumGray: Color {
        Color(hex: 0x656566)
    }

    static var lightGray: Color {
        Color(hex: 0xD4D4D4)
    }

    static var lighterGray: Color {
        Color(hex: 0xEDEDED)
    }

    static var lightestGray: Color {
        Color(hex: 0xF9F9F9)
    }
}

// MARK: - Gladiator (brand color)

public extension Color {
    static var gladiator: Color {
        Color(hex: 0xC8102E)
    }

    static var gladiatorLight: Color {
        Color(hex: 0xFF2E51)
    }

    static var gladiatorLighter: Color {
        Color(hex: 0xFA6780)
    }

    static var gladiatorLightest: Color {
        Color(hex: 0xFFF0F0)
    }
}

// MARK: - Orange

public extension Color {
    static var orangeMedium: Color {
        Color(hex: 0xFF8A00)
    }

    static var orangeLightest: Color {
        Color(hex: 0xFFFBED)
    }
}

// MARK: - Navy

public extension Color {
    static var navyMedium: Color {
        Color(hex: 0x4A6E8D)
    }

    static var navyLight: Color {
        Color(hex: 0x3498DB)
    }

    static var navyLightest: Color {
        Color(hex: 0xEBF5FB)
    }
}
