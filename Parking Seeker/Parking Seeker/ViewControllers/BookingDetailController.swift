//
//  BookingDetailController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-01.
//

import UIKit

class BookingDetailController: UIViewController {
    
    var booking_title: String?
    
    @IBOutlet weak var bookingTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bookingTitle.text = booking_title
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
