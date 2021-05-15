//
//  ProductAPI.swift
//  ProductUI
//
//  Created by Muhammed Rashid on 13/05/21.
//

import Foundation
import ShoppingAPI

enum ProductAPIEndPoint: APIEndPoint {
    case product
    var path: String {
        switch self {
        case .product:
            return "v1/products/all"
        }
    }
}

struct ProductResponse: Decodable {}

class ProductAPI: ShoppingAPIClient {
    func getProductList(completion:@escaping (_ product: [Product]?, _ error: Error?) -> Void) {
        let productRequest = ShoppingAPIRequest(endPoint: ProductAPIEndPoint.product, parameters: [:])
        executeRequest(productRequest) { (response: ShoppingAPIResponse<ProductResponse>) in
        
        }
    }
}
