//
//  ProductFlowCoordinator.swift
//  ProductFlow
//
//  Created by Muhammed Rashid on 12/05/21.
//

import Foundation
import Commons
import ShoppingAPI
import ProductUI
import PaymentUI

class ProductFlowCoordinator: BaseFlowCoordinator {
    var router: Routable
    
    init(router: Routable) {
        self.router = router
        super.init()
    }
    
    override func start() {
        let (productCoordinator, productListVC) = ProductUIModuleFactory.shared.productsListViewController(router: router)
        productCoordinator.flowEventsDelegate = self
        addChildCoordinator(productCoordinator)
        router.setAsRootViewController(productListVC, hideNavigationBar: false)
    }    
}

extension ProductFlowCoordinator: ProductUIEventsDelegate {
    public func purchase(_ product: Product, quantity: Int, flowCoordinator: BaseFlowCoordinator) {
        let purchaseCoordinator = PaymentUIModuleFactory.shared.purchaseProductCoordinator(router: router, product: product, quantity: quantity)
        purchaseCoordinator.flowEventsDelegate = self
        purchaseCoordinator.start()
        addChildCoordinator(purchaseCoordinator)
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
