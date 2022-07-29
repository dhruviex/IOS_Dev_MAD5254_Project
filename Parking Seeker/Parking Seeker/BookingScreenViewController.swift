//
//  BookingScreenViewController.swift
//  Parking Seeker
//
//  Created by Karthik Reddy Rondla on 2022-07-29.
//

import UIKit

class BookingScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtntapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
