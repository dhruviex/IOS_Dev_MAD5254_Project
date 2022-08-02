//
//  MyAccountController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-28.
//

import UIKit

class MyAccountController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //button action for navigation
    @IBAction func myProfileBtnTapped(_ sender: Any) {
        let MyProfileVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
        self.navigationController?.pushViewController(MyProfileVC, animated: true)
    }
    
    @IBAction func paymentDetailsBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func settingsBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func helpBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func contactUsBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func aboutBtnTapped(_ sender: Any) {
        
    }

}
