//
//  MyProfileViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-02.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class MyProfileViewController: UIViewController {
    var ref: DatabaseReference!

    @IBOutlet weak var fullNameTxtField: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var mobileTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        let currentUserData = Auth.auth().currentUser
        self.emailTxt.text = currentUserData?.email
        self.fullNameTxtField.text = ""
        self.mobileTxt.text = ""
        
        let userID = currentUserData?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { snapshot in
          // Get user value
          let value = snapshot.value as? NSDictionary
          let fullname = value?["fullname"] as? String ?? ""
            self.fullNameTxtField.text = fullname
            
            self.mobileTxt.text = ""
        }) { error in
          print(error.localizedDescription)
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func updateBtnTapped(_ sender: Any) {
        let UpdateProfileVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "UpdateProfileController") as! UpdateProfileController
        self.navigationController?.pushViewController(UpdateProfileVC, animated: true)
    }
    
}
