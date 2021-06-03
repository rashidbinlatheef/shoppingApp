//
//  ProductsCoordinator.swift
//  Product
//
//  Created by Muhammed Rashid on 10/05/21.
//

import Foundation
import Commons
import ShoppingAPI

class ProductsCoordinator: BaseFlowCoordinator {
    private var router: Routable
    
    var productUIEventsDelegate: ProductUIEventsDelegate?  {
        (flowEventsDelegate as? ProductUIEventsDelegate)
    }
    
    public init(router: Routable) {
        self.router = router
        super.init()
    }
    
    public override func start() {}
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {}
    
    func showProductDetails(_ product: Product) {
        let productDetailsView = ProductDetailViewController.viewController(coordinator: self, product: product)
        router.pushViewController(productDetailsView)
    }
    
    func buyProduct(_ product: Product) {
        productUIEventsDelegate?.purchase(product, quantity: 1, flowCoordinator: self)
    }
}
