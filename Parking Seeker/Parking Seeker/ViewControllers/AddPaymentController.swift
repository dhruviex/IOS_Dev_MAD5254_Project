//
//  AddPaymentController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-02.
//

import UIKit

class AddPaymentController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func saveBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
