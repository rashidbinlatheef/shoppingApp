//
//  OnboardingFlowCoordinator.swift
//  
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import Commons
import VisitorUI
import PaymentUI
import ShoppingAPI

class OnboardingFlowCoordinator: BaseFlowCoordinator {
    
    private var router: Routable
    
    public init(router: Routable) {
        self.router = router
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func start() {
        let (signInCoordinator, signInVC) = VisitorUIModuleFactory.shared.signInViewController(router: router)
        signInCoordinator.flowEventsDelegate = self
        addChildCoordinator(signInCoordinator)
        router.setAsRootViewController(signInVC)
    }
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {}
}

extension OnboardingFlowCoordinator: VisitorUIEventsDelegate {
    public func didSignInUser(user: User, flowCoordinator: BaseFlowCoordinator) {
        (flowEventsDelegate as? OnboardingFlowEventDelegate)?.didSignInUser(user: user, flowCoordinator: self)
    }
    
    public func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator) {
        // Remove signinCoordinator - take user to upgrade flow
        removeChildCoordinator(flowCoordinator)
        startUpgradeFlow()
    }
    
    private func startUpgradeFlow() {
        let (upgradeCoordinator, upgradeVC) = PaymentUIModuleFactory.shared.upgradeViewController(router: router)
        upgradeCoordinator.flowEventsDelegate = self
        addChildCoordinator(upgradeCoordinator)
        router.setAsRootViewController(upgradeVC)
    }
}

extension OnboardingFlowCoordinator: PaymentUIEventsDelegate {
    public func userCompletedUpgrade(user: User, plan: UpgradePlan, flowCoordinator: BaseFlowCoordinator) {
        // We can remove flowCoordinator:upgradeCoordinator here,
        // It will also get removed once OnboardingFlowCoordinator removed from its parent
        (flowEventsDelegate as? OnboardingFlowEventDelegate)?.didCreateUserAccount(user: user, flowCoordinator: self, upgradePlan: plan)
    }
    
    public func userUpgradeFailed(error: Error, flowCoordinator: BaseFlowCoordinator) {
        // Handle fail cases
    }
    
    public func userUpgradeSkipped(user: User, flowCoordinator: BaseFlowCoordinator) {
        (flowEventsDelegate as? OnboardingFlowEventDelegate)?.didCreateUserAccount(user: user, flowCoordinator: self, upgradePlan: nil)
    }
    
}
