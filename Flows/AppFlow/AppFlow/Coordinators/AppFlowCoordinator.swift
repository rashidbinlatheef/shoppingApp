//
//  AppFlowCoordinator.swift
//  AppFlow
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import UIKit
import Commons
import HomeFlow
import OnboardingFlow
import ShoppingAPI

class AppFlowCoordinator: BaseFlowCoordinator {
    private var router: Routable
    
    public init?(window: UIWindow?) {
        guard let window = window else {
            return nil
        }
        let splashScreenVC = UIViewController()
        let rootNavigationController = UINavigationController(rootViewController: splashScreenVC)
        window.rootViewController = rootNavigationController
        router = Router(rootNavigationController)
        super.init()
    }
    
    override func start() {
        let hasValidUserSession =  SessionManager.sharedInstance.isUserLoggedIn
        if hasValidUserSession {
            startHomeFlow()
        }
        else {
            startOnboardingFlow()
        }
    }
    
    override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
        if let event = event as? HomeFlowEvent {
            handleHomeEvents(event: event, coordinator: flowCoordinator)
        }
    }
}

extension AppFlowCoordinator {
    private func startHomeFlow() {
        let homeFlowCoordinator = HomeFlowModuleFactory.shared.homeFlowCoordinator(router: router)
        homeFlowCoordinator.flowEventsDelegate = self
        homeFlowCoordinator.start()
        addChildCoordinator(homeFlowCoordinator)
    }
    
    private func startOnboardingFlow() {
        let onboardingFlowCoordinator = OnboardingFlowModuleFactory.shared.onboardingCoordinator(router: router)
        onboardingFlowCoordinator.flowEventsDelegate = self
        onboardingFlowCoordinator.start()
        addChildCoordinator(onboardingFlowCoordinator)
    }
    
    private func handleHomeEvents(event: HomeFlowEvent, coordinator: FlowCoordinator) {
        switch event {
        case .logoutUser:
            SessionManager.sharedInstance.isUserLoggedIn = false
            startOnboardingFlow()
            removeChildCoordinator(coordinator)
        }
    }
}

extension AppFlowCoordinator: OnboardingFlowEventDelegate {
    func didSignInUser(user: User, flowCoordinator: BaseFlowCoordinator) {
        handleUserSignIn()
        removeChildCoordinator(flowCoordinator)
    }
    
    func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator, upgradePlan: UpgradePlan?) {
        handleUserSignIn()
        removeChildCoordinator(flowCoordinator)
    }
    
    private func handleUserSignIn() {
        SessionManager.sharedInstance.isUserLoggedIn = true
        startHomeFlow()
    }
}

