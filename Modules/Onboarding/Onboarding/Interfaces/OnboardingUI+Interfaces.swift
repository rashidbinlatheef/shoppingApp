//
//  OnboardingUI+Interfaces.swift
//  Onboarding
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import UIKit
import Commons
import ShoppingAPI

public protocol OnboardingEventsDelegate: FlowEventsDelegate {
    func didSignInUser(user: User, flowCoordinator: BaseFlowCoordinator)
    func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator)
}

public enum OnboardingUIEvent: FlowEvent {}

public protocol OnboardingUIModuleFactoryProtocol {
    func signInViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController)
}

