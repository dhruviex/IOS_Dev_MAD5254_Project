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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //button action for navigation
    @IBAction func myProfileBtnTapped(_ sender: Any) {
        let MyProfileVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
        self.navigationController?.pushViewController(MyProfileVC, animated: true)
    }
    
    @IBAction func paymentDetailsBtnTapped(_ sender: Any) {
        let PaymentListVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "PaymentListController") as! PaymentListController
        self.navigationController?.pushViewController(PaymentListVC, animated: true)
    }
    
    @IBAction func settingsBtnTapped(_ sender: Any) {
        let SettingsVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(SettingsVC, animated: true)
    }
    
    @IBAction func contactUsBtnTapped(_ sender: Any) {
        let ContactUsVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        self.navigationController?.pushViewController(ContactUsVC, animated: true)
    }
    
    @IBAction func aboutBtnTapped(_ sender: Any) {
        let AboutVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        self.navigationController?.pushViewController(AboutVC, animated: true)
    }

}
