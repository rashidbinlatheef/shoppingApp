//
//  User.swift
//  ShoppingAPI
//
//  Created by Muhammed Rashid on 11/05/21.
//

import Foundation

public struct User {
    public init(id: Int64, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    let id: Int64
    let firstName: String
    let lastName: String
    let email: String
    
    public static var dummy: User {
        User(id: 1231, firstName: "John", lastName: "Mathew", email: "john.mathew@gmail.com")
    }
}
