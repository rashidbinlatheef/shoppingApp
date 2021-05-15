//
//  OnboardingFlowViewFactory.swift
//  Onboarding
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import UIKit
import FlowController
import ShoppingAPI

public protocol OnboardingEventsDelegate: FlowEventsDelegate {
    func didSignInUser(user: User, flowCoordinator: BaseFlowCoordinator)
    func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator)
}

public enum OnboardingUIEvent: FlowEvent {}

public protocol OnboardingUIFlowCoordinatorFactory: FlowCoordinatorFactory {
    func signInViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController)
}

public extension OnboardingUIFlowCoordinatorFactory {
    func signInViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController) {
        let signInCoordinator = SignInCoordinator(router: router)
        let signInVC = SignInViewController.viewController(coordinator: signInCoordinator)
        return (signInCoordinator, signInVC)
    }
}
