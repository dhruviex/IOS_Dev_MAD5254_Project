//
//  MyProfileViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-02.
//

import UIKit

class MyProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func updateBtnTapped(_ sender: Any) {
        let UpdateProfileVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "UpdateProfileController") as! UpdateProfileController
        self.navigationController?.pushViewController(UpdateProfileVC, animated: true)
    }
    
}
