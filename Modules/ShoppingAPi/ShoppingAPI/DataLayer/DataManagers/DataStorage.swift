//
//  DataStorage.swift
//  ShoppingAPI
//
//  Created by Muhammed Rashid on 16/05/21.
//

import Foundation

public protocol DataStorage {
    func save(object: Any, forKey key: String) -> Bool
    func object(forKey key: String) -> Any?
    func removeObject(forKey key: String)
}
