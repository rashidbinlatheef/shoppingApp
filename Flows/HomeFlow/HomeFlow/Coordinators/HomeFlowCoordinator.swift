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
import PaymentUI
import ShoppingAPI
import ProductFlow

class HomeFlowCoordinator: BaseFlowCoordinator {
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
        let (productsCoordinator, productVC) = ProductFlowModuleFactory.shared.productFlowCoordinator()
        productsCoordinator.flowEventsDelegate = self
        addChildCoordinator(productsCoordinator)
        productsCoordinator.start()
        let (coordinator, profileVC) = ProfileUIModuleFactory.shared.profileViewController()
        coordinator.flowEventsDelegate = self
        addChildCoordinator(coordinator)
        tabBarController.viewControllers = [productVC, profileVC]
        router.setAsRootViewController(tabBarController, animated: true, hideNavigationBar: true)
    }
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
        if let event = HomeFlowEvent.eventFor(event) {
            flowEventsDelegate?.handleEvent(event, flowCoordinator: self)
        }
    }
}

extension HomeFlowCoordinator: ProfileUIFlowEventsDelegate {}

