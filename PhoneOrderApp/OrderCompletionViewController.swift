//
//  ViewController.swift
//  PhoneOrderApp
//
//  Created by bee on 21/3/2023.
//

import UIKit

class OrderCompletionViewController: UIViewController {
    private var order: PhoneOrder = PhoneOrder()
    public func setOrder(order: PhoneOrder) {
        self.order = order
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onBtnBackToProfileTouchUpInside(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 2
    }
}

