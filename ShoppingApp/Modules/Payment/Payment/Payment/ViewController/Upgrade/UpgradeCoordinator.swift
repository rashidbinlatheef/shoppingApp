//
//  UpgradeCoordinator.swift
//  Payment
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import FlowController
import ShoppingAPI

class UpgradeCoordinator: BaseFlowCoordinator {
    private var router: Routable

    var paymentUIEventsDelegate: PaymentUIEventsDelegate?  {
        (flowEventsDelegate as? PaymentUIEventsDelegate)
    }
    
    public init(router: Routable) {
        self.router = router
        super.init()
    }
    
    public override func start() {}
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
        if let event = event as? UpgradeViewController.Event {
            handleUpgradeViewEvent(event)
        }
    }
    
    private func handleUpgradeViewEvent(_ event: UpgradeViewController.Event) {
        switch event {
        case .upgradeButtonTapped:
            paymentUIEventsDelegate?.userCompletedUpgrade(user: User.dummy, plan: UpgradePlan.dummy, flowCoordinator: self)
        case .skipButtonTapped:
            paymentUIEventsDelegate?.userUpgradeSkipped(user: User.dummy, flowCoordinator: self)
        }
    }
}
