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
    
    let size = ["128GB", "256GB","512GB","1TB"]
    let color = ["Deep Purple","Gold","Silver","Space Black"]
    
    //used picker view for drop down menu
    var sizePickerView = UIPickerView()
    var colorPickerView = UIPickerView()
    
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

}

