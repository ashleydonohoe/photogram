//
//  LoginViewController.swift
//  photogram
//
//  Created by Ashley Donohoe on 5/27/17.
//  Copyright © 2017 Ashley Donohoe. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        // Check for complete user info
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            
            performSegue(withIdentifier: "loginSegue", sender: nil)
            
        } else {
            // Show error if not present
            let alert = UIAlertController(title: "Error", message: "Both email and password required", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
