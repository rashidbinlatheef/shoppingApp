//
//  SignInCoordinator.swift
//  VisitorUI
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import Commons
import ShoppingAPI

class SignInCoordinator: BaseFlowCoordinator {
    private var router: Routable

    public init(router: Routable) {
        self.router = router
        super.init()
    }
    
    public override func start() {}
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
        if let event = event as? SignInViewController.event {
            handleSignInViewEvent(event: event, flowCoordinator: flowCoordinator)
        }
    }
    
    private func handleSignInViewEvent(event: SignInViewController.event, flowCoordinator: FlowCoordinator) {
        switch event {
        case .createAccount:
            let createAccountCoordinator = CreateAccountCoordinator()
            createAccountCoordinator.flowEventsDelegate = self
            let createAccountVC = CreateAccountViewController.viewController(coordinator: createAccountCoordinator)
            router.pushViewController(createAccountVC)
            addChildCoordinator(createAccountCoordinator)
        }
    }
    
    func signInUser(_ username: String?, password: String?) {
        // Do the network calls and on success pass to delegate
        (flowEventsDelegate as? VisitorUIEventsDelegate)?.didSignInUser(user: User.dummy, flowCoordinator: self)
    }
}

extension SignInCoordinator: CreateAccountCoordinatorProtocol {
    func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator) {
        (flowEventsDelegate as? VisitorUIEventsDelegate)?.didCreateUserAccount(user: user, flowCoordinator: self)
    }
}
