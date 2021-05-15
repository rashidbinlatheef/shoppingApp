//
//  ProductUI+FlowController.swift
//  Product
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import FlowController
import UIKit
import ShoppingAPI

public protocol ProductUIEventsDelegate: FlowEventsDelegate {
    func purchase(_ product: Product, quantity: Int, flowCoordinator:  BaseFlowCoordinator)
}

public protocol ProductUIFlowCoordinatorFactory: FlowCoordinatorFactory {
    func productsListViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController)
}

public extension ProductUIFlowCoordinatorFactory {
    func productsListViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController) {
        let productsCoordinator = ProductsCoordinator(router: router)
        let productsListVC = ProductsListViewController.viewController(coordinator: productsCoordinator)
        return (productsCoordinator, productsListVC)
    }
}