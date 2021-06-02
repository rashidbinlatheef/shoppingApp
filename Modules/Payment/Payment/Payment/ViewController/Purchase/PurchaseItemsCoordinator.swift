//
//  PurchaseItemsCoordinator.swift
//  Payment
//
//  Created by Muhammed Rashid on 11/05/21.
//

import FlowController
import ShoppingAPI

class PurchaseItemsCoordinator: BaseFlowCoordinator {
    private var router: Routable
    private var product: Product
    private var quantity: Int = 0
    
    var paymentUIEventsDelegate: PaymentUIEventsDelegate? {
        (flowEventsDelegate as? PaymentUIEventsDelegate)
    }
   
    public init(router: Routable, product: Product, quantity: Int) {
        self.router = router
        self.product = product
        self.quantity = quantity
        super.init()
    }
    
    public override func start() {
        let view = PurchaseItemsViewController.viewController(coordinator: self, product: product, quantity: quantity)
        router.pushViewController(view, animate: true, hideBottomBar: true, completion: nil)
    }
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
      
    }
    
    func buyProduct(_ product: Product, quantity: Int) {
        // API calls
        paymentUIEventsDelegate?.didPurchaseProduct(product: product, flowCoordinator: self)
    }
}
