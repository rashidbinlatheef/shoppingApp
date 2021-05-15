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

public protocol ProfileUIFlowCoordinatorFactory: FlowCoordinatorFactory {
    func profileViewController() -> (BaseFlowCoordinator, UIViewController)
}

public extension ProfileUIFlowCoordinatorFactory {
    func profileViewController() -> (BaseFlowCoordinator, UIViewController) {
        let profileCoordinator = ProfileCoordinator()
        let profileVC = ProfileViewController.viewController(coordinator: profileCoordinator)
        return (profileCoordinator, profileVC)
    }
}
