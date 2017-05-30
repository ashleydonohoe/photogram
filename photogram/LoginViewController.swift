//
//  LoginViewController.swift
//  photogram
//
//  Created by Ashley Donohoe on 5/27/17.
//  Copyright © 2017 Ashley Donohoe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

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
            // If the user has an account
            FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                // If error, show the error as an alert if the error is not FIRAuthErrorCodeUserNotFound
                if error != nil {
                    // If error is FIRAuthErrorCodeUserNotFound
                    if(error!.localizedDescription.contains("no user record")) {
                        // Try to create an account
                        FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                            if error != nil {
                                // show error message
                                self.showAlert(alertTitle: "Error", message: "Error creating account", actionTitle: "OK")
                            } else {
                                // Add user to database
                                let users = FIRDatabase.database().reference().child("users")
                                users.child(user!.uid).child("email").setValue(user!.email)
                                // continue into app
                                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                            }
                        })
                    } else {
                        // Else show error
                        self.showAlert(alertTitle: "Error", message: "Could not log in or create account", actionTitle: "OK")
                    }
                } else {
                    // If no password error or network error, they're logged in and continue into the app
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)

                }
            })
        } else {
            // Show error if not present
            showAlert(alertTitle: "Error", message: "Both username and password required", actionTitle: "OK")
        }
    }
    
    func showAlert(alertTitle: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
