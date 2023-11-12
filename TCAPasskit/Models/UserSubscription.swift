//
// Created by Austin Anaya on 11/12/23
//

import SwiftData
import SwiftUI

@Model
class PersistentUserSubscription: ObservableObject, Hashable {
    var id: String
    var servicingTrainer: String?
    var productName: String?
    var purchasePrice: String?

    init(id: String, servicingTrainer: String? = nil, productName: String? = nil, purchasePrice: String? = nil) {
        self.id = id
        self.servicingTrainer = servicingTrainer
        self.productName = productName
        self.purchasePrice = purchasePrice
    }
}

struct UserSubscription: Codable, Identifiable, Hashable {
    var id: String
    var servicingTrainer: String?
    var productName: String?
    var purchasePrice: String?

    func asPersistentData() -> PersistentUserSubscription {
        return PersistentUserSubscription(id: id, servicingTrainer: servicingTrainer, productName: productName, purchasePrice: purchasePrice)
    }
}
