//
//  AppFlow+Interfaces.swift
//  AppFlow
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import Commons
import UIKit

public protocol AppFlowModuleFactoryProtocol {
    func appCoordinator(window: UIWindow?) -> BaseFlowCoordinator?
}
