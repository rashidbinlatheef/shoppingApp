//
//  ProductUIModuleFactory.swift
//  ProductUI
//
//  Created by Muhammed Rashid on 02/06/21.
//

import Foundation
import FlowController
import UIKit

public class ProductUIModuleFactory: ProductUIModuleFactoryProtocol {
    public static let shared = ProductUIModuleFactory()
    private init() {}
    
    public func productsListViewController(router: Routable) -> (BaseFlowCoordinator, UIViewController) {
        let productsCoordinator = ProductsCoordinator(router: router)
        let productsListVC = ProductsListViewController.viewController(coordinator: productsCoordinator)
        return (productsCoordinator, productsListVC)
    }
}
