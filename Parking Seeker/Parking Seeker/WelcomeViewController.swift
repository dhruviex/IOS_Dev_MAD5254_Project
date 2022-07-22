//
//  WelcomeViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-05.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func startBtnTapped(_ sender: Any) {
        let LoginViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(LoginViewController, animated: true)
    }
    

    
}
