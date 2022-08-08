//
//  ContactUsViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-02.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ContactUsViewController: UIViewController {
    var ref: DatabaseReference!
    
    @IBOutlet weak var emailTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        let currentUserData = Auth.auth().currentUser
        self.emailTxtField.text = currentUserData?.email
    }
    

    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
