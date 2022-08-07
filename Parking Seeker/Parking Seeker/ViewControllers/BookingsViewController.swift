//
//  BookingsViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-28.
//

import UIKit

class BookingsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let screenWidth = UIScreen.main.bounds.width
    
    let test_booking_titles = ["Fairview Mall", "Scarborough Town Centre", "Parkway Mall","Fairview Mall", "Scarborough Town Centre", "Parkway Mall"]
    
    @IBOutlet weak var bookingCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //collection view datasource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        test_booking_titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingViewCell", for: indexPath) as! BookingViewCell
        cell.booking_title.text = test_booking_titles[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let BookingDetailController = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "BookingDetailController") as! BookingDetailController
        BookingDetailController.booking_title = test_booking_titles[indexPath.row]
        self.navigationController?.pushViewController(BookingDetailController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: screenWidth - 20, height: 180)
    }
}
