//
//  ProfileUI+FlowController.swift
//  Profile
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import FlowController
import UIKit

public protocol ProfileUIFlowEventsDelegate: FlowEventsDelegate {}

public enum ProfileUIEvent: FlowEvent {
    case logoutUser
}

public protocol ProfileModuleFactoryProtocol {
    func profileViewController() -> (BaseFlowCoordinator, UIViewController)
}

public class ProfileUIModuleFactory: ProfileModuleFactoryProtocol {
    public static let shared = ProfileUIModuleFactory()
    private init() {}
    
    public func profileViewController() -> (BaseFlowCoordinator, UIViewController) {
        let profileCoordinator = ProfileCoordinator()
        let profileVC = ProfileViewController.viewController(coordinator: profileCoordinator)
        return (profileCoordinator, profileVC)
    }
}
