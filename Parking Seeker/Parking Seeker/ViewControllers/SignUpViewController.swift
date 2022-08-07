//
//  SignUpViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-22.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullNameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    
    var activityIndicator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addActivityIndicator()
    }
    
    func addActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @IBAction func signupBtnTapped(_ sender: Any) {
        let fullName = self.fullNameTxtField.text
        let emailText = self.emailTxtField.text
        let mobileText = self.mobileTxtField.text
        let passwordText = self.passwordTxtField.text
        let confirmPasswordText = self.confirmPasswordTxtField.text
        
        if (fullName != "") {
            if (emailText != "") {
                if (mobileText != "") {
                    if (passwordText != "") {
                        if (confirmPasswordText != "") {
                            self.activityIndicator.startAnimating()
                            Auth.auth().createUser(withEmail: emailText!, password: passwordText!) {(authResult, error) in
                                self.activityIndicator.stopAnimating()
                                if let user = authResult?.user {
                                    print(user)
                                } else {
                                    print("ERROR")
                                }
                            }
                        } else {
                            Helper.showAlertAction(title: "Alert", message: "Please enter your confirm password", viewController: self)
                        }
                    } else {
                        Helper.showAlertAction(title: "Alert", message: "Please enter your password", viewController: self)
                    }
                } else {
                    Helper.showAlertAction(title: "Alert", message: "Please enter your mobile number", viewController: self)
                }
            } else {
                Helper.showAlertAction(title: "Alert", message: "Please enter your email", viewController: self)
            }
        } else {
            Helper.showAlertAction(title: "Alert", message: "Please enter your full name", viewController: self)
        }
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
