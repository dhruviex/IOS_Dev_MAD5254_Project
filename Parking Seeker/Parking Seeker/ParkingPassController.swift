//
//  ParkingPassController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-04.
//

import UIKit

class ParkingPassController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
