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
    
    @IBAction func confirmBookingTap(_ sender: Any) {
        let ParkingPassVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ParkingPassController") as! ParkingPassController
        self.navigationController?.pushViewController(ParkingPassVC, animated: true)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
