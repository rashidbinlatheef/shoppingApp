//
//  ProductFlow+FlowController.swift
//  ProductFlow
//
//  Created by Muhammed Rashid on 12/05/21.
//

import Foundation
import FlowController
import UIKit

public protocol ProductFlowCoordinatorFactory: FlowCoordinatorFactory {
    func productFlowCoordinator() -> (BaseFlowCoordinator, UIViewController)
}

public extension ProductFlowCoordinatorFactory {
    func productFlowCoordinator() -> (BaseFlowCoordinator, UIViewController) {
        let productFlowNavVC = UINavigationController()
        let productFlowRouter = Router(productFlowNavVC)
        let productCoordinator = ProductFlowCoordinator(router: productFlowRouter)
        return (productCoordinator, productFlowNavVC)
    }
}
