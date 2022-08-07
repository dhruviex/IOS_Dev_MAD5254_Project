//
//  PaymentListController.swift
//  Parking Seeker
//
//  Created by parth on 2022-08-02.
//

import UIKit

class PaymentListController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var paymentCollectionView: UICollectionView!
    
    let screenWidth = UIScreen.main.bounds.width
    
    let test_card_list = ["4545 ****", "5646 ****"]
    let test_card_images = ["ic_card_visa", "ic_card_mastercard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //collection view datasource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        test_card_list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentViewCell", for: indexPath) as! PaymentViewCell
        cell.card_number.text = test_card_list[indexPath.row]
        cell.card_image.image = UIImage(named: (test_card_images[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: screenWidth - 20, height: 60)
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addNewCardBtnTap(_ sender: Any) {
        let AddPaymentVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "AddPaymentController") as! AddPaymentController
        self.navigationController?.pushViewController(AddPaymentVC, animated: true)
    }
    
}
