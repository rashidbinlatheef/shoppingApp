//
//  ProfileUI+Interfaces.swift
//  Profile
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import FlowController
import UIKit

public protocol ProfileUIFlowEventsDelegate: FlowEventsDelegate {}

public enum ProfileUIEvent: FlowEvent {
    case logoutUser
}

public protocol ProfileModuleFactoryProtocol {
    func profileViewController() -> (BaseFlowCoordinator, UIViewController)
}

