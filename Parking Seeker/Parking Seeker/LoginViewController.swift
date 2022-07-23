//
//  LoginViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        let AddVehicleVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "AddVehicleController") as! AddVehicleController
        self.navigationController?.pushViewController(AddVehicleVC, animated: true)
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
