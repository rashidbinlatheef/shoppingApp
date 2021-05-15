//
//  ProductsListViewController.swift
//  Product
//
//  Created by Muhammed Rashid on 09/05/21.
//

import UIKit
import ShoppingAPI

class ProductsListViewController: UIViewController {
    private weak var coordinator: ProductsCoordinator?
    public static func viewController(coordinator: ProductsCoordinator) -> ProductsListViewController {
        let storyboard = UIStoryboard(name: "Products", bundle: Bundle(for: Self.self))
        let productsListVC = storyboard.instantiateViewController(identifier: "ProductsListVC") as! ProductsListViewController
        productsListVC.coordinator = coordinator
        return productsListVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.title = "Products"
        // Do any additional setup after loading the view.
    }
}

extension ProductsListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let width = collectionView.frame.width - spacing
        return CGSize(width: width/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = Product(identifier: "PRD2123", name: "Arm Chair", price: 120, description: "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.")
        coordinator?.showProductDetails(selectedProduct)
    }
}
