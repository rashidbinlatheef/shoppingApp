//
//  SignInCoordinator.swift
//  VisitorUI
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import Commons
import ShoppingAPI

protocol CreateAccountCoordinatorProtocol: FlowEventsDelegate {
    func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator)
}

class CreateAccountCoordinator: BaseFlowCoordinator {
    public override func start() {}
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
    }
    
    func createAccountWith(email: String?, name: String?, password: String?) {
        print("Creating Account......")
        print("Hooray!!! Account Created......")
        (flowEventsDelegate as? CreateAccountCoordinatorProtocol)?.didCreateUserAccount(user: User.dummy, flowCoordinator: self)
    }
}
