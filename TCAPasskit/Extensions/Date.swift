//
// Created by Austin Anaya on 10/27/23
//

import Foundation

extension Date {
    func add(amount: Int, type: Calendar.Component) -> Date {
        var dateComponents = DateComponents()
        dateComponents.setValue(amount, for: type)

        return Calendar.current.date(byAdding: dateComponents, to: self) ?? self
    }
}
