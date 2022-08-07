//
//  SettingsViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-02.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func changePasswordTapped(_ sender: Any) {
        let ChangePasswordVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ChangePasswordController") as! ChangePasswordController
        self.navigationController?.pushViewController(ChangePasswordVC, animated: true)
    }
}
