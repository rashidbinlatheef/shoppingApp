//
//  ProfileCoordinator.swift
//  Profile
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import Commons

class ProfileCoordinator: BaseFlowCoordinator {
    
    public override func start() {}
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
        guard let event = event as? ProfileViewEvent else {
            return
        }
        
        switch event {
        case .logoutButtonTapped:
            flowEventsDelegate?.handleEvent(ProfileUIEvent.logoutUser, flowCoordinator: self)
            break
        }
    }
}
