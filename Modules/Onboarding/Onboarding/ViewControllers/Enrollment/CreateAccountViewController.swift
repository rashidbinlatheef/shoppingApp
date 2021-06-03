//
//  CreateAccountViewController.swift
//  Onboarding
//
//  Created by Muhammed Rashid on 09/05/21.
//

import UIKit
import Commons

class CreateAccountViewController: UIViewController {    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    weak var coordinator: CreateAccountCoordinator?

    public static func viewController(coordinator: CreateAccountCoordinator) -> CreateAccountViewController {
        let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle(for: Self.self))
        let createAcccountVC = storyboard.instantiateViewController(identifier: "CreateAccountVC") as! CreateAccountViewController
        createAcccountVC.coordinator = coordinator
        return createAcccountVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction private func createAccountButtonTapped() {
        coordinator?.createAccountWith(email: emailTextField?.text, name: nameTextField?.text, password: passwordTextField?.text)
    }
}
