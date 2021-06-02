//
//  ProductFlowModuleFactory.swift
//  ProductFlow
//
//  Created by Muhammed Rashid on 02/06/21.
//

import Foundation
import FlowController
import UIKit

public class ProductFlowModuleFactory: ProductFlowModuleFactoryProtocol {
    public static let shared = ProductFlowModuleFactory()
    private init() {}

    public func productFlowCoordinator() -> (BaseFlowCoordinator, UIViewController) {
        let productFlowNavVC = UINavigationController()
        let productFlowRouter = Router(productFlowNavVC)
        let productCoordinator = ProductFlowCoordinator(router: productFlowRouter)
        // Initialise the tbar bar items
        
        let productsTabBarItem = UITabBarItem(title: "Products", image: UIImage(named: "products", in: Bundle(for: Self.self), compatibleWith: .none), tag: 0)
        productFlowNavVC.tabBarItem = productsTabBarItem
        return (productCoordinator, productFlowNavVC)
    }
}
