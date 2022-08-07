//
//  ChangePasswordController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-22.
//

import UIKit

class ChangePasswordController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
