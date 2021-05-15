//
//  UpgradeViewController.swift
//  Payment
//
//  Created by Muhammed Rashid on 09/05/21.
//

import UIKit
import FlowController

class UpgradeViewController: UIViewController {
    enum Event: FlowEvent {
        case upgradeButtonTapped
        case skipButtonTapped
    }

    weak var coordinator: UpgradeCoordinator?
    
    public static func viewController(coordinator: UpgradeCoordinator) -> UpgradeViewController {
        let storyboard = UIStoryboard(name: "Upgrade", bundle: Bundle(for: Self.self))
        let upgradeVC = storyboard.instantiateViewController(identifier: "UpgradeVC") as! UpgradeViewController
        upgradeVC.coordinator = coordinator
        return upgradeVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func upgradeButtonTapped() {
        coordinator?.sendEvent(UpgradeViewController.Event.upgradeButtonTapped)
    }
    
    @IBAction private func skipButtonTapped() {
        coordinator?.sendEvent(UpgradeViewController.Event.skipButtonTapped)
    }
}
