//
//  HomeViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-28.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController, GMSMapViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let screenWidth = UIScreen.main.bounds.width
    
    let test_place_titles = ["Fairview Mall", "Scarborough Town Centre", "Parkway Mall","Fairview Mall", "Scarborough Town Centre", "Parkway Mall"]
    
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: 43.7627453, longitude: -79.316767, zoom: 15.0)
        mapView.camera = camera
        showMarker(position: camera.target)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //custom marker for test
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = position
        marker.map = mapView
    }

    //test detail box
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        lbl1.text = "Hi there!"
        view.addSubview(lbl1)
        
        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
        lbl2.text = "I am a custom info window."
        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(lbl2)

        return view
    }
    
    
    
    //collection view datasource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        test_place_titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceViewCell", for: indexPath) as! PlaceViewCell
        cell.place_title.text = test_place_titles[indexPath.row]
//        cell.place_details_btn.addTarget(self, action: #selector(self.viewDetailsTap(sender:), for: .touchUpInside)
        return cell
    }
                                         
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth - 40, height: 180)
    }

}
