//
//  OnboardingFlow+Interfaces.swift
//  OnboardingFlow
//
//  Created by Muhammed Rashid on 13/05/21.
//

import Foundation
import FlowController
import ShoppingAPI

public protocol OnboardingFlowEventDelegate: FlowEventsDelegate {
    func didSignInUser(user: User, flowCoordinator: BaseFlowCoordinator)
    func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator, upgradePlan: UpgradePlan?)
}

public protocol OnboardingFlowModuleFactoryProtocol {
    func onboardingCoordinator(router: Routable) -> BaseFlowCoordinator
}
