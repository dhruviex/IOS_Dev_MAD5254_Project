//
//  OtpViewController.swift
//  Parking Seeker
//
//  Created by Karthik Reddy Rondla on 2022-07-22.
//

import UIKit

class OtpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitBtnTapped(_ sender: Any) {
        let ChangePasswordVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ChangePasswordController") as! ChangePasswordController
        self.navigationController?.pushViewController(ChangePasswordVC, animated: true)
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
