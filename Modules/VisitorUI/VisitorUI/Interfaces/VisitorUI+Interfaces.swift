//
//  VisitorUI+Interfaces.swift
//  VisitorUI
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import UIKit
import Commons
import ShoppingAPI

public protocol VisitorUIEventsDelegate: FlowEventsDelegate {
    func didSignInUser(user: User, flowCoordinator: BaseFlowCoordinator)
    func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator)
}

public enum VisitorUIEvent: FlowEvent {}

public protocol VisitorUIModuleFactoryProtocol {
    func signInViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController)
}

