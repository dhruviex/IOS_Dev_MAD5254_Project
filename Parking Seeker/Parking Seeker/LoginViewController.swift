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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }


    @IBAction func signupBtnTapped(_ sender: Any) {
        let SignUpVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(SignUpVC, animated: true)
    }
}
