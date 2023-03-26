//
//  OrderDetailViewController.swift
//  PhoneOrderApp
//
//  Created by Alan on 26/3/2023.
//

import UIKit

class OrderDetailViewController: UIViewController {
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var storageLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderStatusLabel: UILabel!
    @IBOutlet weak var phoneImage: UIImageView!
    
    private var order: PhoneOrder = PhoneOrder()
    public func setOrder(order: PhoneOrder) {
        self.order = order
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelLabel.text = order.model
        storageLabel.text = order.storage
        colorLabel.text = order.color
        orderDateLabel.text = order.createDate
        orderStatusLabel.text = order.status
        phoneImage.image = UIImage(named: "iPhone 14 Pro Max")
    }

}
