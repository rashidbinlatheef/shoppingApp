//
//  SessionManager.swift
//  ShoppingAPI
//
//  Created by Muhammed Rashid on 16/05/21.
//

import Foundation

public class SessionManager {
    public static let sharedInstance = SessionManager()
    let persistanceStore = PersistantStorage.sharedInstance
    
    private let isUserLoggedInKey = "isUserLoggedInKey"
    private init(){}
    
    public var isUserLoggedIn: Bool {
        get {
            persistanceStore.object(forKey: isUserLoggedInKey) as? Bool ?? false
        }
        set {
            persistanceStore.save(object: newValue, forKey: isUserLoggedInKey)
        }
    }
}
