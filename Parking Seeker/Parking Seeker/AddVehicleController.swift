//
//  AddVehicleController.swift
//  Parking Seeker
//
//  Created by parth on 2022-07-22.
//

import UIKit
import iOSDropDown

class AddVehicleController: UIViewController {

    @IBOutlet weak var selectVehicleDropDown: DropDown!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manageDropDown()
    }
    
    func manageDropDown() {
        selectVehicleDropDown.optionArray = ["SUV","Hatchback","Crossover","Convertible","Sedan","Sports Car","Coupe","Minivan","Station Wagon","Pickup Truck"]
        selectVehicleDropDown.optionIds = [1,2,3,4,5,6,7,8,9,10]
        selectVehicleDropDown.selectedRowColor = .gray
        selectVehicleDropDown.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index)")
        }
    }
    
    @IBAction func addVehicleBtnTapped(_ sender: Any) {
        //assigning tab view controller as root view controller
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "TabBarController")
        sceneDelegate!.window?.rootViewController = initialViewController
        sceneDelegate!.window?.makeKeyAndVisible()
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
