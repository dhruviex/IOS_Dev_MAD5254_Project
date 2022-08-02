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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
