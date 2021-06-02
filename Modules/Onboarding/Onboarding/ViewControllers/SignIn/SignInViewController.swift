//
//  SignInViewController.swift
//  Onboarding
//
//  Created by Muhammed Rashid on 28/04/21.
//

import UIKit
import FlowController

class SignInViewController: UIViewController {
    enum event: FlowEvent {
        case createAccount
    }
    weak var coordinator: SignInCoordinator?
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    public static func viewController(coordinator: SignInCoordinator) -> SignInViewController {
        let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle(for: Self.self))
        let signInVC = storyboard.instantiateViewController(identifier: "SignInVC") as! SignInViewController
        signInVC.coordinator = coordinator
        return signInVC
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.text = "test@test.com"
        passwordTextField.text = "testPassword"
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func signInButtonTapped() {
        coordinator?.signInUser(usernameTextField?.text, password: passwordTextField?.text)
    }
    
    @IBAction private func signUpButtonTapped() {
        coordinator?.sendEvent(SignInViewController.event.createAccount)
    }
}
