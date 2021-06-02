//
//  ProfileUIModuleFactory.swift
//  ProfileUI
//
//  Created by Muhammed Rashid on 02/06/21.
//

import Foundation
import FlowController
import UIKit

public class ProfileUIModuleFactory: ProfileModuleFactoryProtocol {
    public static let shared = ProfileUIModuleFactory()
    private init() {}
    
    public func profileViewController() -> (BaseFlowCoordinator, UIViewController) {
        let profileCoordinator = ProfileCoordinator()
        let profileVC = ProfileViewController.viewController(coordinator: profileCoordinator)
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        profileVC.tabBarItem = profileTabBarItem        
        return (profileCoordinator, profileVC)
    }
}
