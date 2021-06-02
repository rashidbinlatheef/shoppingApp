//
//  PersistantStorage.swift
//  ShoppingAPI
//
//  Created by Muhammed Rashid on 16/05/21.
//

import Foundation

class PersistantStorage: DataStorage {
    
    static let sharedInstance = PersistantStorage()
    
    private init() {
        
    }
    private var store =  UserDefaults(suiteName: "shopping.app")
    
    @discardableResult
    public func save(object: Any, forKey key: String) -> Bool {
        guard let store = self.store else {
            return false
        }
        store.setValue(object, forKey: key)
        return store.synchronize()
    }
    
    public func object(forKey key: String) -> Any? {
        guard let store = self.store else {
            return nil
        }
        return store.object(forKey: key)
    }
    
    public func removeObject(forKey key: String) {
        store?.removeObject(forKey: key)
    }
}
