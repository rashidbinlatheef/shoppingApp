//
//  UpgradePlan.swift
//  ShoppingAPI
//
//  Created by Muhammed Rashid on 11/05/21.
//

import Foundation

public struct UpgradePlan {
    public init(identifier: String, name: String, description: String, price: Double) {
        self.identifier = identifier
        self.name = name
        self.description = description
        self.price = price
    }
    
    let identifier: String
    let name: String
    let description: String
    let price: Double
    
    public static var dummy: UpgradePlan {
        UpgradePlan(identifier: "1231", name: "VIP", description: "dummy description", price: 12.2)
    }
}
