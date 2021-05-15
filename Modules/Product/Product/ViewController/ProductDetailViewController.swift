//
//  ProductDetailViewController.swift
//  Product
//
//  Created by Muhammed Rashid on 09/05/21.
//

import UIKit
import ShoppingAPI

class ProductDetailViewController: UIViewController {
    private weak var coordinator: ProductsCoordinator?
    private var product: Product!
    
    public static func viewController(coordinator: ProductsCoordinator, product: Product) -> ProductDetailViewController {
        let storyboard = UIStoryboard(name: "Products", bundle: Bundle(for: Self.self))
        let productsDetailVC = storyboard.instantiateViewController(identifier: "ProductDetailVC") as! ProductDetailViewController
        productsDetailVC.coordinator = coordinator
        productsDetailVC.product = product
        return productsDetailVC
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func buyNowButtonTapped() {
        coordinator?.buyProduct(product)
    }
}
