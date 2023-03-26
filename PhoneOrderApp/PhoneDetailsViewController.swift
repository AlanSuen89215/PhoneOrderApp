//
//  PhoneDetailsViewController.swift
//  PhoneOrderApp
//
//  Created by Po Lam Wong on 21/3/2023.
//

import UIKit

class PhoneDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phonePriceLabel: UILabel!
    
    let size = ["128GB", "256GB","512GB","1TB"]
    let color = ["Deep Purple","Gold","Silver","Space Black"]
    
    //used picker view for drop down menu
    var sizePickerView = UIPickerView()
    var colorPickerView = UIPickerView()
    
    var phoneImage = UIImage()
    var phoneName = ""
    var phonePrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sizeTextField.inputView = sizePickerView
        colorTextField.inputView = colorPickerView
        
        sizeTextField.placeholder = "Select Storage Size"
        colorTextField.placeholder = "Pick your favourite Color "
        
        sizeTextField.textAlignment = .center
        colorTextField.textAlignment = .center
        
        sizePickerView.delegate = self
        colorPickerView.delegate = self
        sizePickerView.dataSource = self
        colorPickerView.dataSource = self
        
        sizePickerView.tag = 1
        colorPickerView.tag = 2
        
        phoneLabel.text = phoneName
        phoneImageView.image = phoneImage
        phonePriceLabel.text = "Price: $" + String(phonePrice)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //function for drop down menu
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return size.count
        case 2:
            return color.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return size[row]
        case 2:
            return color[row]
        default:
            return "Data not found"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            sizeTextField.text = size[row]
            sizeTextField.resignFirstResponder()
        case 2:
            colorTextField.text = color[row]
            colorTextField.resignFirstResponder()
        default:
            return
        }
    }

    @IBAction func onBtnContinueTouchUpInside(_ sender: UIButton) {
        var order = PhoneOrder()
        order.model = phoneName
        order.price = phonePrice
        order.storage = sizeTextField.text!
        order.color = colorTextField.text!
        
        if let toVC = storyboard?.instantiateViewController(identifier:"ConfirmationViewController") as? ConfirmationViewController {
            toVC.setOrder(order: order)
            self.navigationController?.pushViewController(toVC, animated: true)
        }
    }
}

