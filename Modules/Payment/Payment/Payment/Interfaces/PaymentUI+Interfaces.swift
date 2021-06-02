//
//  PaymentUI+Interfaces.swift
//  Payment
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import UIKit
import FlowController
import ShoppingAPI

public enum PaymentFlowEvent: FlowEvent {}

public protocol PaymentUIEventsDelegate: FlowEventsDelegate {
    func userCompletedUpgrade(user: User, plan: UpgradePlan, flowCoordinator: BaseFlowCoordinator)
    func userUpgradeFailed(error: Error, flowCoordinator: BaseFlowCoordinator)
    func userUpgradeSkipped(user: User, flowCoordinator: BaseFlowCoordinator)
    func didPurchaseProduct(product: Product, flowCoordinator: BaseFlowCoordinator)
    func didFailPurchaseProduct(product: Product, error: Error, flowCoordinator: BaseFlowCoordinator)
}

// Optional implementation
public extension PaymentUIEventsDelegate {
    func userCompletedUpgrade(user: User, plan: UpgradePlan, flowCoordinator: BaseFlowCoordinator) {}
    func userUpgradeFailed(error: Error, flowCoordinator: BaseFlowCoordinator) {}
    func userUpgradeSkipped(user: User, flowCoordinator: BaseFlowCoordinator) {}
    func didPurchaseProduct(product: Product, flowCoordinator: BaseFlowCoordinator) {}
    func didFailPurchaseProduct(product: Product, error: Error, flowCoordinator: BaseFlowCoordinator) {}
}

public protocol PaymentUIModuleFactoryProtocol {
    func upgradeViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController)
    func purchaseProductCoordinator(router: Routable, product: Product, quantity: Int) -> BaseFlowCoordinator
}
