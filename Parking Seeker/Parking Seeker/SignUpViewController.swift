//
//  SignUpViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-22.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
