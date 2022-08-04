//
//  ParkingDetailController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-03.
//

import UIKit

class ParkingDetailController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
