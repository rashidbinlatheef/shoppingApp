//
//  HomeFlowCoordinator.swift
//  HomeFlow
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import FlowController
import UIKit
import ProfileUI
import ProductUI
import PaymentUI
import ShoppingAPI
import ProductFlow

class HomeFlowCoordinator: BaseFlowCoordinator, ProfileUIFlowCoordinatorFactory, PaymentUIFlowCoordinatorFactory, ProductFlowCoordinatorFactory {
    private var tabBarController = UITabBarController()
    private var router: Routable
   
    public init(router: Routable) {
        self.router = router
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func start() {
        let (productsCoordinator, productVC) = productFlowCoordinator()
        productsCoordinator.flowEventsDelegate = self
        addChildCoordinator(productsCoordinator)
        productsCoordinator.start()
        let (coordinator, profileVC) = profileViewController()
        coordinator.flowEventsDelegate = self
        tabBarController.viewControllers = [productVC, profileVC]
        addChildCoordinator(coordinator)
        router.setAsRootViewController(tabBarController, animated: true, hideNavigationBar: true)
    }
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
        if let event = HomeFlowEvent.eventFor(event) {
            flowEventsDelegate?.handleEvent(event, flowCoordinator: self)
        }
    }
}

extension HomeFlowCoordinator: ProfileUIFlowEventsDelegate {}

extension HomeFlowCoordinator: ProductUIEventsDelegate {
    public func purchase(_ product: Product, quantity: Int, flowCoordinator: BaseFlowCoordinator) {
        let purchaseCoordinator = purchaseProductCoordinator(router: router, product: product, quantity: quantity)
        purchaseCoordinator.flowEventsDelegate = self
        purchaseCoordinator.start()
        addChildCoordinator(purchaseCoordinator)
    }
}
