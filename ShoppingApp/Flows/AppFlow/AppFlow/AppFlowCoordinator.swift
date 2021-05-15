//
//  AppFlowCoordinator.swift
//  AppFlow
//
//  Created by Muhammed Rashid on 09/05/21.
//

import Foundation
import UIKit
import FlowController
import HomeFlow
import OnboardingFlow
import ShoppingAPI

public class AppFlowCoordinator: BaseFlowCoordinator, HomeFlowCoordinatorFactory, OnboardingFlowCoordinatorFactory {
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
    
    public override func start() {
        // If User Has Onboarded
        let hasValidUserSession = false
        if hasValidUserSession {
            startHomeFlow()
        }
        else {
            startOnboardingFlow()
        }
    }
    
    public override func handleEvent(_ event: FlowEvent, flowCoordinator: FlowCoordinator) {
        if let event = event as? HomeFlowEvent {
            handleHomeEvents(event: event, coordinator: flowCoordinator)
        }
    }
}

extension AppFlowCoordinator {
    private func startHomeFlow() {
        let homeFlowCoordinator = homeFlowCoordinator(router: router)
        homeFlowCoordinator.flowEventsDelegate = self
        homeFlowCoordinator.start()
        addChildCoordinator(homeFlowCoordinator)
    }
    
    private func startOnboardingFlow() {
        let onboardingFlowCoordinator = onboardingCoordinator(router: router)
        onboardingFlowCoordinator.flowEventsDelegate = self
        onboardingFlowCoordinator.start()
        addChildCoordinator(onboardingFlowCoordinator)
    }
    
    private func handleHomeEvents(event: HomeFlowEvent, coordinator: FlowCoordinator) {
        switch event {
        case .completed:
            startOnboardingFlow()
            removeChildCoordinator(coordinator)
        case .logoutUser:
            startOnboardingFlow()
            removeChildCoordinator(coordinator)
        }
    }
}

extension AppFlowCoordinator: OnboardingFlowEventDelegate {
    public func didSignInUser(user: User, flowCoordinator: BaseFlowCoordinator) {
        startHomeFlow()
        removeChildCoordinator(flowCoordinator)
    }
    
    public func didCreateUserAccount(user: User, flowCoordinator: BaseFlowCoordinator, upgradePlan: UpgradePlan?) {
        startHomeFlow()
        removeChildCoordinator(flowCoordinator)
    }
}

//TODO:
// 4. Add Payment events delegate in payment flow
// 5. If needed add payment flow delegate in homeflow(is not needed right now)
// 6. Create persistance store for storing isUserLogedin, has upgaraded -
// 7. Add upgrade button in profile screen
// 8. move networking module to common
// 9. Add app specific network layer
