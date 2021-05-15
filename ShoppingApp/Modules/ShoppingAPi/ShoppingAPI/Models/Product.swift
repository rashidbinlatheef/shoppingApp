//
//  Product.swift
//  ShoppingAPI
//
//  Created by Muhammed Rashid on 11/05/21.
//

import Foundation

public struct Product {
    let identifier: String
    let name: String
    let price: Double
    let description: String
    public init(identifier: String, name: String, price: Double, description: String) {
        self.identifier = identifier
        self.name = name
        self.price = price
        self.description = description
    }
    
    public static var dummy: Product {
        Product(identifier: "122321", name: "Arm Chair", price: 120, description: "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.")
    }
}
