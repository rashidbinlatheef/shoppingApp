//
//  PaymentUIModuleFactory.swift
//  PaymentUI
//
//  Created by Muhammed Rashid on 02/06/21.
//

import Foundation
import UIKit
import FlowController
import ShoppingAPI

public class PaymentUIModuleFactory: PaymentUIModuleFactoryProtocol {
    public static let shared = PaymentUIModuleFactory()
    private init() {}
    
    public func upgradeViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController) {
        let upgradeCoordinator = UpgradeCoordinator(router: router)
        let upgradeVC = UpgradeViewController.viewController(coordinator: upgradeCoordinator)
        return (upgradeCoordinator, upgradeVC)
    }
    
    public func purchaseProductCoordinator(router: Routable, product: Product, quantity: Int) -> BaseFlowCoordinator {
        let purchaseCoordinator = PurchaseItemsCoordinator(router: router, product: product, quantity: quantity)
        return purchaseCoordinator
    }
}
