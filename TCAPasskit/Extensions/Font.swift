//
// Created by Austin Anaya on 11/12/23
//

import SwiftUI

extension Font {
    static let bold = "Gotham-Bold"
    static let regular = "Gotham-Medium"
    static let book = "Gotham-Book"
    static let bookItalic = "Gotham-BookItalic"
}

// MARK: - Paragraph

extension Font {
    enum Heading {
        /// Size 48
        static var one: Font {
            Font.custom(bold, size: 48)
        }

        /// Size 24
        static var two: Font {
            Font.custom(bold, size: 24)
        }
    }

    enum Display {
        /// Size 18
        static var three: Font {
            Font.custom(bold, size: 18)
        }

        /// Size 10
        static var six: Font {
            Font.custom(bold, size: 10)
        }
    }

    enum Paragraph {
        enum Regular {
            /// Size 18
            static var large: Font {
                Font.custom(regular, size: 18)
            }

            /// Size 16
            static var medium: Font {
                Font.custom(regular, size: 16)
            }

            /// Size 14
            static var small: Font {
                Font.custom(regular, size: 14)
            }

            /// Size 12
            static var extraSmall: Font {
                Font.custom(regular, size: 12)
            }

            /// Size 10
            static var tiny: Font {
                Font.custom(regular, size: 10)
            }
        }

        enum Book {
            /// Size 16
            static var medium: Font {
                Font.custom(book, size: 16)
            }

            /// Size 14
            static var small: Font {
                Font.custom(book, size: 14)
            }

            /// Size 12
            static var extraSmall: Font {
                Font.custom(book, size: 12)
            }

            /// Size 10
            static var tiny: Font {
                Font.custom(book, size: 10)
            }

            /// Size 8
            static var extraTiny: Font {
                Font.custom(book, size: 10)
            }
        }

        enum Italic {
            /// Size 16
            static var medium: Font {
                Font.custom(bookItalic, size: 16)
            }

            /// Size 14
            static var small: Font {
                Font.custom(bookItalic, size: 14)
            }

            /// Size 12
            static var extraSmall: Font {
                Font.custom(bookItalic, size: 12)
            }

            /// Size 10
            static var tiny: Font {
                Font.custom(bookItalic, size: 10)
            }
        }

        enum Bold {
            /// Size 32
            static var extraExtraLarge: Font {
                Font.custom(bold, size: 32)
            }

            /// Size 24
            static var extraLarge: Font {
                Font.custom(bold, size: 24)
            }

            /// Size 18
            static var large: Font {
                Font.custom(bold, size: 18)
            }

            /// Size 16
            static var medium: Font {
                Font.custom(bold, size: 16)
            }

            /// Size 14
            static var small: Font {
                Font.custom(bold, size: 14)
            }

            /// Size 12
            static var extraSmall: Font {
                Font.custom(bold, size: 12)
            }

            /// Size 10
            static var tiny: Font {
                Font.custom(bold, size: 10)
            }
        }
    }
}
