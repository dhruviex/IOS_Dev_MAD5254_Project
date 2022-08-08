//
//  HomeViewController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-28.
//

import UIKit
import GoogleMaps
import FirebaseFirestore

class HomeViewController: UIViewController, GMSMapViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate {
    
    let screenWidth = UIScreen.main.bounds.width
    
    let place_items_list = NSMutableArray()
    
    var mLocationManager = CLLocationManager()
    var mDidFindMyLocation = false
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.userLocation()
        self.setFirebaseData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //manage user location
    func userLocation() {
        mLocationManager.delegate = self
        mLocationManager.requestWhenInUseAuthorization()
        self.mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        if (status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.mapView.isMyLocationEnabled = true
        }

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        if (!mDidFindMyLocation) {
            let myLocation: CLLocation = change![NSKeyValueChangeKey.newKey] as! CLLocation
            // show location on map
            self.mapView.camera = GMSCameraPosition.camera(withTarget: myLocation.coordinate, zoom: 11.0)
            self.mapView.settings.myLocationButton = true
            mDidFindMyLocation = true
        }

    }
    
    //manage data from firebase and display markers
    func setFirebaseData() {
        let db = Firestore.firestore()
        db.collection("ParkingSpots").getDocuments() {
            (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)");
            } else {
                var count = 0
                for document in querySnapshot!.documents {
                    count += 1
                    print("\(document.documentID) => \(document.data())");
                    
                    //set parking spot marker on map
                    let current_data = document.data()
                    let Location = current_data["Location"] as! GeoPoint
                    let lat = Location.latitude
                    let lon = Location.longitude
                    let coor = CLLocationCoordinate2DMake(lat, lon)
                    
                    //set price view for marker
                    let marker = GMSMarker()
                    marker.position = coor
                    marker.title = current_data["Price"] as? String
                    marker.map = self.mapView
                    
                    var place_obj = [String: Any]()
                    place_obj["place_name"] = current_data["Name"] as? String
                    place_obj["place_address"] = current_data["Address"] as? String
                    place_obj["place_price"] = current_data["Price"] as? String
                    place_obj["place_spots"] = current_data["Spots"] as? Int
                    place_obj["spots_details"] = current_data["Details"] as? String
                    self.place_items_list.add(place_obj)
                    self.placesCollectionView.reloadData()
                    
                }
                print("Count = \(count)");
            }
        }
    }
    

    //test detail box
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 50))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let priceLable = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: view.frame.size.height - 16))
        priceLable.text = marker.title
        priceLable.font = .boldSystemFont(ofSize: 20)
        priceLable.textAlignment = .center
        view.addSubview(priceLable)
        
        return view
    }
    
    
    
    //collection view datasource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.place_items_list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceViewCell", for: indexPath) as! PlaceViewCell
        
        let place_data = self.place_items_list[indexPath.row] as! NSDictionary
        cell.place_title.text = place_data["place_name"] as? String
        cell.place_price.text = place_data["place_price"] as? String
        cell.place_address.text = place_data["place_address"] as? String
        
        let parking_spots = place_data["place_spots"]
        cell.place_spots.text = "\(parking_spots!) spots"
        
        cell.place_details_btn.addTarget(self, action: #selector(viewDetailsTap), for: .touchUpInside)
        return cell
    }
                                
    @objc func viewDetailsTap() -> Void {
        let ParkingDetailVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ParkingDetailController") as! ParkingDetailController
        
        let place_data = self.place_items_list[indexPath.row] as! NSDictionary
        let parking_spots = place_data["place_spots"]
        ParkingDetailVC.place_name_str = place_data["place_name"] as? String
        ParkingDetailVC.place_price_str = place_data["place_price"] as? String
        ParkingDetailVC.place_address_str = place_data["place_address"] as? String
        ParkingDetailVC.place_spots_str = "\(parking_spots!) spots"
        ParkingDetailVC.spot_details_str = place_data["spot_details"] as? String
        
        self.navigationController?.pushViewController(ParkingDetailVC, animated: true)
    }
                                         
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth - 40, height: 180)
    }

}
