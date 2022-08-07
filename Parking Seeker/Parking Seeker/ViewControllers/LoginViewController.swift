//
//  LoginViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
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
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
        let emailText = self.emailTxtField.text
        let passwordText = self.passwordTxtField.text
            if (emailText != "") {
            if (passwordText != "") {
                print(emailText!)
                print(passwordText!)
                self.activityIndicator.startAnimating()
                Auth.auth().signIn(withEmail: emailText!, password: passwordText!) { (result, error) in
                    self.activityIndicator.stopAnimating()
                    print("RESULT---->")
                    print(result as Any)
                    let AddVehicleVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "AddVehicleController") as! AddVehicleController
                    self.navigationController?.pushViewController(AddVehicleVC, animated: true)
                }
            } else {
                Helper.showAlertAction(title: "Alert", message: "Please enter your password", viewController: self)
            }
            } else {
                Helper.showAlertAction(title: "Alert", message: "Please enter your email", viewController: self)
            }
    }
    

    @IBAction func signupBtnTapped(_ sender: Any) {
        let SignUpVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(SignUpVC, animated: true)
    }
    
    @IBAction func forgotPwdTapped(_ sender: Any) {
        let ForgotPasswordVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ForgotPasswordController") as! ForgotPasswordController
        self.navigationController?.pushViewController(ForgotPasswordVC, animated: true)
    }
}
