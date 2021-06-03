//
//  OnboardingFlowModuleFactory.swift
//  OnboardingFlow
//
//  Created by Muhammed Rashid on 02/06/21.
//

import Foundation
import Commons

public class OnboardingFlowModuleFactory: OnboardingFlowModuleFactoryProtocol {
    public static let shared = OnboardingFlowModuleFactory()
    private init() {}
    
    public func onboardingCoordinator(router: Routable) -> BaseFlowCoordinator {
        let onboardingFlowCoordinator = OnboardingFlowCoordinator(router: router)
        return onboardingFlowCoordinator
    }
}
