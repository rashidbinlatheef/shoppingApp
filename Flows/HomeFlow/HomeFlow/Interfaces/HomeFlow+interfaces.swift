//
//  HomeFlow+FlowController.swift
//  HomeFlow
//
//  Created by Muhammed Rashid on 13/05/21.
//

import Foundation
import FlowController
import ProfileUI

public enum HomeFlowEvent: FlowEvent {
    case logoutUser

    static func eventFor(_ event: FlowEvent) -> FlowEvent? {
        if let event = event as? ProfileUIEvent {
            switch event {
            case .logoutUser:
                return HomeFlowEvent.logoutUser
            }
        }
        return nil
    }
}

public protocol HomeFlowModuleFactoryProtocol {
    func homeFlowCoordinator(router: Routable) -> BaseFlowCoordinator
}
