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
        return (productCoordinator, productFlowNavVC)
    }
}
