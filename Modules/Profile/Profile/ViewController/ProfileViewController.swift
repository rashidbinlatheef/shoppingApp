//
//  ProfileViewController.swift
//  Profile
//
//  Created by Muhammed Rashid on 09/05/21.
//

import UIKit
import FlowController

enum ProfileViewEvent: FlowEvent{
    case logoutButtonTapped
}

class ProfileViewController: UIViewController {
    weak var coordinator: ProfileCoordinator?
    
    public static func viewController(coordinator: ProfileCoordinator) -> ProfileViewController {
        let storyboard = UIStoryboard(name: "Profile", bundle: Bundle(for: Self.self))
        let profileVC = storyboard.instantiateViewController(identifier: "ProfileVC") as! ProfileViewController
        profileVC.coordinator = coordinator
        return profileVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Profile"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction private func logoutButtonTapped() {
        coordinator?.sendEvent(ProfileViewEvent.logoutButtonTapped)
    }
}
