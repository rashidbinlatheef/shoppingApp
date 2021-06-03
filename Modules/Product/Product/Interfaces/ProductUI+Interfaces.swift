//
//  ProductUI+Interfaces.swift
//  Product
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import Commons
import UIKit
import ShoppingAPI

public protocol ProductUIEventsDelegate: FlowEventsDelegate {
    func purchase(_ product: Product, quantity: Int, flowCoordinator:  BaseFlowCoordinator)
}

public protocol ProductUIModuleFactoryProtocol {
    func productsListViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController)
}
