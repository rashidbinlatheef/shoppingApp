//
//  ProductFlowCoordinator.swift
//  PrductFlow
//
//  Created by Muhammed Rashid on 12/05/21.
//

import Foundation
import FlowController
import ShoppingAPI
import ProductUI
import PaymentUI

class ProductFlowCoordinator: BaseFlowCoordinator, ProductUIFlowCoordinatorFactory, PaymentUIFlowCoordinatorFactory {
    var router: Routable
    
    init(router: Routable) {
        self.router = router
        super.init()
    }
    
    override func start() {
        let (productCoordinator, productListVC) = productsListViewController(router: router)
        productCoordinator.flowEventsDelegate = self
        addChildCoordinator(productCoordinator)
        router.setAsRootViewController(productListVC, hideNavigationBar: false)
    }    
}

extension ProductFlowCoordinator: ProductUIEventsDelegate {
    public func purchase(_ product: Product, quantity: Int, flowCoordinator: BaseFlowCoordinator) {
        print("purchase \(flowCoordinator) -  \(CFGetRetainCount(flowCoordinator))")
        let purchaseCoordinator = purchaseProductCoordinator(router: router, product: product, quantity: quantity)
        purchaseCoordinator.flowEventsDelegate = self
        purchaseCoordinator.start()
        addChildCoordinator(purchaseCoordinator)
        print("purchase \(flowCoordinator) -  \(CFGetRetainCount(flowCoordinator))")
    }
}

extension ProductFlowCoordinator: PaymentUIEventsDelegate {
    public func didPurchaseProduct(product: Product, flowCoordinator: BaseFlowCoordinator) {
        router.popToRootViewController(animated: true)
        removeChildCoordinator(flowCoordinator)
    }
    
    public func didFailPurchaseProduct(product: Product, error: Error, flowCoordinator: BaseFlowCoordinator) {
        
    }
}
