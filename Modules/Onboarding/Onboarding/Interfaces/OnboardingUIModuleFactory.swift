//
//  OnboardingUIModuleFactory.swift
//  OnboardingUI
//
//  Created by Muhammed Rashid on 02/06/21.
//

import Foundation
import UIKit
import Commons

public class OnboardingUIModuleFactory: OnboardingUIModuleFactoryProtocol {
    public static let shared = OnboardingUIModuleFactory()
    private init() {}

    public func signInViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController) {
        let signInCoordinator = SignInCoordinator(router: router)
        let signInVC = SignInViewController.viewController(coordinator: signInCoordinator)
        return (signInCoordinator, signInVC)
    }
}
