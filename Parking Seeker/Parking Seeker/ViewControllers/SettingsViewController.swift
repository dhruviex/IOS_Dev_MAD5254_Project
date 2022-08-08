//
//  SettingsViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-02.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func signoutBtnTap(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let rootVC = storyboard.instantiateViewController(identifier: "WelcomeViewController") as? WelcomeViewController
            let rootNC = UINavigationController(rootViewController: rootVC!)
            rootNC.navigationBar.isHidden = true
            sceneDelegate!.window?.rootViewController = rootNC
            sceneDelegate!.window?.makeKeyAndVisible()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func changePasswordTapped(_ sender: Any) {
        let ChangePasswordVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ChangePasswordController") as! ChangePasswordController
        self.navigationController?.pushViewController(ChangePasswordVC, animated: true)
    }
}
