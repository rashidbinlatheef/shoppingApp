//
//  AppFlowCoordinator+CoordinatorFactory.swift
//  AppFlow
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import FlowController
import UIKit

public protocol AppFlowCoordinatorFactory: FlowCoordinatorFactory {
    func appCoordinator(window: UIWindow?) -> BaseFlowCoordinator?
}

public extension AppFlowCoordinatorFactory {
    func appCoordinator(window: UIWindow?) -> BaseFlowCoordinator? {
        let appFlowCoordinator  = AppFlowCoordinator(window: window)
        return appFlowCoordinator
    }
}
