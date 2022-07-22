//
//  ForgotPasswordController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-22.
//

import UIKit

class ForgotPasswordController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        let OtpVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController
        self.navigationController?.pushViewController(OtpVC, animated: true)
    }
    
}
