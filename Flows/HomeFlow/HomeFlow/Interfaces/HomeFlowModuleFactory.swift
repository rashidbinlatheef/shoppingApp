//
//  HomeFlowModuleFactory.swift
//  HomeFlow
//
//  Created by Muhammed Rashid on 02/06/21.
//

import Foundation
import FlowController

public class HomeFlowModuleFactory: HomeFlowModuleFactoryProtocol {
    public static let shared = HomeFlowModuleFactory()
    private init() {}
    
    public func homeFlowCoordinator(router: Routable) -> BaseFlowCoordinator {
        let homeFlowCoordinator = HomeFlowCoordinator(router: router)
        return homeFlowCoordinator
    }
}
