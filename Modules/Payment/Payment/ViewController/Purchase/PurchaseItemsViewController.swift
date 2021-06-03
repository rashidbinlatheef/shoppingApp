//
//  PurchaseItemsViewController.swift
//  Payment
//
//  Created by Muhammed Rashid on 09/05/21.
//

import UIKit
import ShoppingAPI

class PurchaseItemsViewController: UIViewController {
    weak var coordinator: PurchaseItemsCoordinator?
    var product: Product?
    var quantity: Int = 1

    public static func viewController(coordinator: PurchaseItemsCoordinator, product: Product, quantity: Int) -> PurchaseItemsViewController {
        let storyboard = UIStoryboard(name: "Purchase", bundle: Bundle(for: Self.self))
        let purchaseVC = storyboard.instantiateViewController(identifier: "PurchaseItemsVC") as! PurchaseItemsViewController
        purchaseVC.coordinator = coordinator
        purchaseVC.product = product
        purchaseVC.quantity = quantity
        return purchaseVC
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction private func buyButtonTapped() {
        if let product = product {
            coordinator?.buyProduct(product, quantity: quantity)
        }
    }

}
