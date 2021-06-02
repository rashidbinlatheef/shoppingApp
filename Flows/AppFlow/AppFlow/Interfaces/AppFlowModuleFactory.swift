//
//  AppFlowModuleFactory.swift
//  AppFlow
//
//  Created by Muhammed Rashid on 02/06/21.
//

import Foundation
import FlowController
import UIKit

public class AppFlowModuleFactory: AppFlowModuleFactoryProtocol {
    public static let shared = AppFlowModuleFactory()
    private init() {}
    
    public func appCoordinator(window: UIWindow?) -> BaseFlowCoordinator? {
        let appFlowCoordinator  = AppFlowCoordinator(window: window)
        return appFlowCoordinator
    }
}
