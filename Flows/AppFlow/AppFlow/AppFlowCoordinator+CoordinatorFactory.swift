//
//  AppFlowCoordinator+CoordinatorFactory.swift
//  AppFlow
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import FlowController
import UIKit

public protocol AppFlowModuleFactoryProtocol {
    func appCoordinator(window: UIWindow?) -> BaseFlowCoordinator?
}

public class AppFlowModuleFactory: AppFlowModuleFactoryProtocol {
    public static let shared = AppFlowModuleFactory()
    private init() {}
    
    public func appCoordinator(window: UIWindow?) -> BaseFlowCoordinator? {
        let appFlowCoordinator  = AppFlowCoordinator(window: window)
        return appFlowCoordinator
    }
}
