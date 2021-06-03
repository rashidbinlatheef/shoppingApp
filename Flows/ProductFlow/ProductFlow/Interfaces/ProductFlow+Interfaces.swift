//
//  ProductFlow+Interfaces.swift
//  ProductFlow
//
//  Created by Muhammed Rashid on 12/05/21.
//

import Foundation
import Commons
import UIKit

public protocol ProductFlowModuleFactoryProtocol {
    func productFlowCoordinator() -> (BaseFlowCoordinator, UIViewController)
}
