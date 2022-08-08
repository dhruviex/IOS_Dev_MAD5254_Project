//
//  ParkingDetailController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-03.
//

import UIKit

class ParkingDetailController: UIViewController {

    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBOutlet weak var place_title: UILabel!
    @IBOutlet weak var place_address: UILabel!
    @IBOutlet weak var place_image: UIImageView!
    @IBOutlet weak var parking_spots: UILabel!
    @IBOutlet weak var spot_detail_txt: UILabel!
    var currentHours = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hoursLabel.text = "\(currentHours) Hour"
    }
    
    @IBAction func plusBtnTap(_ sender: Any) {
        currentHours = currentHours + 1
        let hoursText = "\(currentHours) Hours"
        self.hoursLabel.text = hoursText
    }
    
    @IBAction func minusBtnTap(_ sender: Any) {
        if (currentHours > 1) {
            currentHours = currentHours - 1
            var hoursText = ""
            if (currentHours == 1) {
                hoursText = "\(currentHours) Hour"
            } else {
                hoursText = "\(currentHours) Hours"
            }
            self.hoursLabel.text = hoursText
        }
    }
    
    @IBAction func callBtnTap(_ sender: Any) {
        
    }
    
    @IBAction func confirmBookingTap(_ sender: Any) {
        let ParkingPassVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ParkingPassController") as! ParkingPassController
        self.navigationController?.pushViewController(ParkingPassVC, animated: true)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
