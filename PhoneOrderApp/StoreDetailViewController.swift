//
//  StoreDetailViewController.swift
//  PhoneOrderApp
//
//  MAPD724 W23 iOS assignment 2 part 1
//  Created by Group 9 on 2023-03-21.
//

import UIKit

class StoreDetailViewController: UIViewController {

    var store = MyPointAnnotation()
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblHours: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        lblName.text = store.name
        lblAddress.text = store.address
        lblHours.text = store.hours
        lblPhone.text = store.phone
        lblRating.text = store.rating
    }
    
}
