//
//  ShoppingAPIClient.swift
//  ShoppingAPI
//
//  Created by Muhammed Rashid on 13/05/21.
//

import Foundation
import Networking
import Commons

public protocol APIEndPoint {
    var path: String { get }
}

public enum ShoppingAPIResponse<ResponseType> {
    case success(ResponseType)
    case failure(Error)
}

public struct ShoppingAPIRequest {
    public init(endPoint: APIEndPoint, parameters: [String : Any]?, headers: [String : String]? = nil, method: RequestMethod = .get) {
        self.endPoint = endPoint
        self.parameters = parameters
        self.headers = headers
        self.method = method
    }
    
    let endPoint: APIEndPoint
    let parameters:[String: Any]?
    let headers: [String: String]?
    let method: RequestMethod
}



open class ShoppingAPIClient: NetworkClientProtocol {
    
    public func executeRequest<Response: Decodable>(_ request: ShoppingAPIRequest, completion: @escaping (_ response: ShoppingAPIResponse<Response>) -> Void ) {
        let baseURL = "www.dummy176342675.com/"
        
        executeRequestWith(urlString: baseURL + request.endPoint.path, parameters: request.parameters, headers: request.headers, method: request.method) { data, response, error  in
            if let error = error {
                completion(ShoppingAPIResponse.failure(error))
            }
            else if let data = data {
                guard let responseObj = data.decodeTo(Response.self) else {
                    return
                }
                completion(ShoppingAPIResponse.success(responseObj))
            }
        }
    
    }
}
