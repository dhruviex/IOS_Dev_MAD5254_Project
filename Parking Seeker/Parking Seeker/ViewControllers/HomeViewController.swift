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
        let camera = GMSCameraPosition.camera(withLatitude: 43.7627453, longitude: -79.316767, zoom: 11.0)
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
        
        let marker2=GMSMarker()
        marker2.position = CLLocationCoordinate2DMake(43.779709, -79.345032)
        marker2.title = "Fairview Mall"
        marker2.map = mapView


//marker for Scarborough town center
        let marker3=GMSMarker()
        marker3.position = CLLocationCoordinate2DMake(43.775223, -79.257148)
        marker3.title = "Scarborough Town Centre"
        marker3.map = mapView
        
        let marker4=GMSMarker()
        marker4.position = CLLocationCoordinate2DMake(43.7573, -79.3116)
        marker4.title = "Parkway Mall"
        marker4.map = mapView
        
        let marker5=GMSMarker()
        marker5.position = CLLocationCoordinate2DMake(43.7732, -79.3361)
        marker5.title = "Lambton College In Toronto"
        marker5.map = mapView
        
        let marker6=GMSMarker()
        marker6.position = CLLocationCoordinate2DMake(43.6426, -79.3871)
        marker6.title = "CN Tower"
        marker6.map = mapView
        
        let marker7=GMSMarker()
        marker7.position = CLLocationCoordinate2DMake(43.7169, -79.3389)
        marker7.title = "Ontario Science Centre"
        marker7.map = mapView
        
        let marker8=GMSMarker()
        marker8.position = CLLocationCoordinate2DMake(43.6677, -79.3948)
        marker8.title = "Royal Ontario Museum"
        marker8.map = mapView
        
        
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
        cell.place_details_btn.addTarget(self, action: #selector(viewDetailsTap), for: .touchUpInside)
        return cell
    }
                                
    @objc func viewDetailsTap() -> Void {
        let ParkingDetailVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ParkingDetailController") as! ParkingDetailController
        self.navigationController?.pushViewController(ParkingDetailVC, animated: true)
    }
                                         
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth - 40, height: 180)
    }

}
