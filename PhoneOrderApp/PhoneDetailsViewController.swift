//
//  MAPD724 W2023
//  Group 9
//  Assignment 2 - Frameworks App - Part 1
//  App description: Phone Order App
//  Author: Po Lam Wong, Lizolet (301258847)
//          Chi Hung Sum, Samuel (300858503)
//          Chun Fun Suen, Alan (301277969)

//  PhoneDetailsViewController.swift
//  Date: MAR 26, 2023
//  Version: 1.0
//

import UIKit

class PhoneDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phonePriceLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    //apple phone size list
    let apple_size = ["128GB", "256GB","512GB","1TB"]
    let iPhone14_size = ["128GB", "256GB","512GB"]
    let iPhone12_size = ["64GB","128GB","256GB"]
    
    //apple phone color list
    let iPhone14Pro_color = ["Deep Purple","Gold","Silver","Space Black"]
    let iPhone14_color = ["Blue","Purple","Yellow","Midnight","Starlight","(PRODUCT)RED"]
    let iPhone13_color = ["Blue","Pink","Green","Midnight","Starlight","(PRODUCT)RED"]
    let iPhone12_color = ["Blue","Purple","Green","White","Black","(PRODUCT)RED"]
    let iPhoneSE_color = ["Midnight","Starlight","(PRODUCT)RED"]
    
    //google phone size list
    let pixel7Pro_size = ["128GB","256GB"]
    let pixel_size = ["128GB"]
    
    //google color list
    let pixel7Pro_color = ["Hazel","Snow","Obsidian"]
    let pixel7_color = ["Lemongrass","Snow","Obsidian"]
    let pixel6a_color = ["Sage","Chalk","Charcoal"]
    let pixel6_color = ["Sorta Seafoam","Kinda Coral","Stormy Black"]
    let pixel6Pro_color = ["Cloudy White","Sorta Sunny","Stormy Black"]
    
    //samsung phone size list
    let s23Ultra_size = ["256GB","512GB","1TB"]
    let s23Plus_size = ["256GB","512GB"]
    let s23_size = ["128GB","256GB"]
    
    //samsung color list
    let s23Ultra_color = ["Green","Phantomblack","Lavender","Cream","Graphite","Skyblue","Red","Lime"]
    let s23_color = ["Green","Phantomblack","Lavender","Cream","Graphite","Lime"]
    let s22Ultra_color = ["Green","Phantomwhite","Skyblue","Red","Graphite","Burgundy"]
    let s22_color = ["Green","Phantomblack","Graphite","Bora Purple","Violet","Cream","Skyblue","Pinkgold"]
    let fold4_color = ["Graygreen","Phantomblack","Burgundy","Beige"]
    let flip4_color = ["Bora Purple","Graphite","Pinkgold","Blue"]
    let s21_color = ["Graphite","Olive","White","Lavender"]
    
    let google_size = ["128GB", "256GB", "512GB"]
    let color = ["White","Gray"]
    
    //used picker view for drop down menu
    var sizePickerView = UIPickerView()
    var colorPickerView = UIPickerView()
    
    var phoneImage = UIImage()
    var phoneName = ""
    var brandText = ""
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
        brandLabel.text = "Brand: " + brandText
        phonePriceLabel.text = "Price: $" + String(phonePrice)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //function for drop down menu
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            if phoneName == "iPhone 14 Pro Max" || phoneName == "iPhone 14 Pro" {
                return apple_size.count
            } else if phoneName == "iPhone 14" || phoneName == "iPhone 14 Plus" || phoneName == "iPhone 13" || phoneName == "iPhone 13 Mini" || phoneName == "Galaxy S22 Ultra" || phoneName == "Galaxy Z Flip4" {
                return iPhone14_size.count
            } else if phoneName == "iPhone 12" || phoneName == "iPhone SE" {
                return iPhone12_size.count
            } else if phoneName == "Pixel 7 Pro" || phoneName == "Pixel 7" {
                return pixel7Pro_size.count
            } else if phoneName == "Pixel 6a" || phoneName == "Pixel 6" || phoneName == "Pixel 6 Pro"{
                return pixel_size.count
            } else if phoneName == "Galaxy S23 Ultra" || phoneName == "Galaxy Z Fold4" {
                return s23Ultra_size.count
            } else if phoneName == "Galaxy S23+" {
                return s23Plus_size.count
            } else if phoneName == "Galaxy S23" || phoneName == "Galaxy S22" || phoneName == "Galaxy S21 FE 5G" || phoneName == "Galaxy Z Flip3 5G" {
                return s23_size.count
            } else {
                return google_size.count
            }
        case 2:
            if phoneName == "iPhone 14 Pro Max" || phoneName == "iPhone 14 Pro" {
                return iPhone14Pro_color.count
            } else if phoneName == "iPhone 14" || phoneName == "iPhone 14 Plus"{
                return iPhone14_color.count
            } else if phoneName == "iPhone 13" || phoneName == "iPhone 13 Mini" {
                return iPhone13_color.count
            } else if phoneName == "iPhone 12" {
                return iPhone12_color.count
            } else if phoneName == "iPhone SE" {
                return iPhoneSE_color.count
            } else if phoneName == "Pixel 7 Pro" {
                return pixel7Pro_color.count
            } else if phoneName == "Pixel 7" {
                return pixel7_color.count
            } else if phoneName == "Pixel 6a" {
                return pixel6a_color.count
            } else if phoneName == "Pixel 6" {
                return pixel6_color.count
            } else if phoneName == "Pixel 6 Pro" {
                return pixel6Pro_color.count
            } else if phoneName == "Galaxy S23 Ultra" {
                return s23Ultra_color.count
            } else if phoneName == "Galaxy S23+" || phoneName == "Galaxy S23" {
                return s23_color.count
            } else if phoneName == "Galaxy S22 Ultra" {
                return s22Ultra_color.count
            } else if phoneName == "Galaxy S22" {
                return s22_color.count
            } else if phoneName == "Galaxy Z Fold4" {
                return fold4_color.count
            } else if phoneName == "Galaxy Z Flip4" {
                return flip4_color.count
            } else if phoneName == "Galaxy S21 FE 5G" {
                return s21_color.count
            } else {
                return color.count
            }
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            if phoneName == "iPhone 14 Pro Max" || phoneName == "iPhone 14 Pro" {
                return apple_size[row]
            } else if phoneName == "iPhone 14" || phoneName == "iPhone 14 Plus" || phoneName == "iPhone 13" || phoneName == "iPhone 13 Mini" || phoneName == "Galaxy S22 Ultra" || phoneName == "Galaxy Z Flip4"{
                return iPhone14_size[row]
            } else if phoneName == "iPhone 12" || phoneName == "iPhone SE" {
                return iPhone12_size[row]
            } else if phoneName == "Pixel 7 Pro" || phoneName == "Pixel 7" {
                return pixel7Pro_size[row]
            } else if phoneName == "Pixel 6a" || phoneName == "Pixel 6" || phoneName == "Pixel 6 Pro"{
                return pixel_size[row]
            } else if phoneName == "Galaxy S23 Ultra" || phoneName == "Galaxy Z Fold4" {
                return s23Ultra_size[row]
            } else if phoneName == "Galaxy S23+" {
                return s23Plus_size[row]
            } else if phoneName == "Galaxy S23" || phoneName == "Galaxy S22" || phoneName == "Galaxy S21 FE 5G" || phoneName == "Galaxy Z Flip3 5G" {
                return s23_size[row]
            } else {
                return google_size[row]
            }
        case 2:
            if phoneName == "iPhone 14 Pro Max" || phoneName == "iPhone 14 Pro" {
                return iPhone14Pro_color[row]
            } else if phoneName == "iPhone 14" || phoneName == "iPhone 14 Plus" {
                return iPhone14_color[row]
            } else if phoneName == "iPhone 13" || phoneName == "iPhone 13 Mini" {
                return iPhone13_color[row]
            } else if phoneName == "iPhone 12" {
                return iPhone12_color[row]
            } else if phoneName == "iPhone SE" {
                return iPhoneSE_color[row]
            } else if phoneName == "Pixel 7 Pro" {
                return pixel7Pro_color[row]
            } else if phoneName == "Pixel 7" {
                return pixel7_color[row]
            } else if phoneName == "Pixel 6a" {
                return pixel6a_color[row]
            } else if phoneName == "Pixel 6" {
                return pixel6_color[row]
            } else if phoneName == "Pixel 6 Pro" {
                return pixel6Pro_color[row]
            } else if phoneName == "Galaxy S23 Ultra" {
                return s23Ultra_color[row]
            } else if phoneName == "Galaxy S23+" || phoneName == "Galaxy S23" {
                return s23_color[row]
            } else if phoneName == "Galaxy S22 Ultra" {
                return s22Ultra_color[row]
            } else if phoneName == "Galaxy S22" {
                return s22_color[row]
            } else if phoneName == "Galaxy Z Fold4" {
                return fold4_color[row]
            } else if phoneName == "Galaxy Z Flip4" {
                return flip4_color[row]
            } else if phoneName == "Galaxy S21 FE 5G" {
                return s21_color[row]
            } else {
                return color[row]
            }
        default:
            return "Data not found"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            if phoneName == "iPhone 14 Pro Max" {
                sizeTextField.text = apple_size[row]
                //change product price due to different storage size
                if sizeTextField.text == "128GB" {
                    phonePriceLabel.text = "Price: $1549.0"
                } else if sizeTextField.text == "256GB" {
                    phonePriceLabel.text = "Price: $1699.0"
                } else if sizeTextField.text == "512GB" {
                    phonePriceLabel.text = "Price: $1969.0"
                } else {
                    phonePriceLabel.text = "Price: $2239.0"
                }
                
            } else if phoneName == "iPhone 14 Pro" {
                sizeTextField.text = apple_size[row]
                if sizeTextField.text == "128GB" {
                    phonePriceLabel.text = "Price: $1399.0"
                } else if sizeTextField.text == "256GB" {
                    phonePriceLabel.text = "Price: $1549.0"
                } else if sizeTextField.text == "512GB" {
                    phonePriceLabel.text = "Price: $1819.0"
                } else {
                    phonePriceLabel.text = "Price: $2089.0"
                }
                
            } else if phoneName == "iPhone 14" {
                sizeTextField.text = iPhone14_size[row]
                if sizeTextField.text == "128GB" {
                    phonePriceLabel.text = "Price: $1099.0"
                } else if sizeTextField.text == "256GB" {
                    phonePriceLabel.text = "Price: $1249.0"
                } else {
                    phonePriceLabel.text = "Price: $1519.0"
                }
                
            } else if phoneName == "iPhone 14 Plus" {
                sizeTextField.text = iPhone14_size[row]
                if sizeTextField.text == "128GB" {
                    phonePriceLabel.text = "Price: $1249.0"
                } else if sizeTextField.text == "256GB" {
                    phonePriceLabel.text = "Price: $1399.0"
                } else {
                    phonePriceLabel.text = "Price: $1669.0"
                }
                
            } else if phoneName == "iPhone 13" {
                sizeTextField.text = iPhone14_size[row]
                if sizeTextField.text == "128GB" {
                    phonePriceLabel.text = "Price: $999.0"
                } else if sizeTextField.text == "256GB" {
                    phonePriceLabel.text = "Price: $1149.0"
                } else {
                    phonePriceLabel.text = "Price: $1419.0"
                }
                
            } else if phoneName == "iPhone 13 Mini" {
                sizeTextField.text = iPhone14_size[row]
                if sizeTextField.text == "128GB" {
                    phonePriceLabel.text = "Price: $849.0"
                } else if sizeTextField.text == "256GB" {
                    phonePriceLabel.text = "Price: $999.0"
                } else {
                    phonePriceLabel.text = "Price: $1269.0"
                }
            
            } else if phoneName == "iPhone 12" {
                sizeTextField.text = iPhone12_size[row]
                if sizeTextField.text == "128GB" {
                    phonePriceLabel.text = "Price: $919.0"
                } else if sizeTextField.text == "256GB" {
                    phonePriceLabel.text = "Price: $1069.0"
                } else {
                    phonePriceLabel.text = "Price: $849.0"
                }
                
            } else if phoneName == "iPhone SE"  {
                sizeTextField.text = iPhone12_size[row]
                if sizeTextField.text == "128GB" {
                    phonePriceLabel.text = "Price: $649.0"
                } else if sizeTextField.text == "256GB" {
                    phonePriceLabel.text = "Price: $789.0"
                } else {
                    phonePriceLabel.text = "Price: $579.0"
                }
                
            } else if phoneName == "Galaxy S22 Ultra" {
                sizeTextField.text = iPhone14_size[row]
            } else if phoneName == "Galaxy Z Flip4" {
                sizeTextField.text = iPhone14_size[row]
            } else if phoneName == "iPhone 12" || phoneName == "iPhone SE" {
                sizeTextField.text = iPhone12_size[row]
            } else if phoneName == "Pixel 7 Pro" || phoneName == "Pixel 7" {
                sizeTextField.text = pixel7Pro_size[row]
            } else if phoneName == "Pixel 6a" || phoneName == "Pixel 6" || phoneName == "Pixel 6 Pro"{
                sizeTextField.text = pixel_size[row]
            } else if phoneName == "Galaxy S23 Ultra" || phoneName == "Galaxy Z Fold4" {
                sizeTextField.text = s23Ultra_size[row]
            } else if phoneName == "Galaxy S23+" {
                sizeTextField.text = s23Plus_size[row]
            } else if phoneName == "Galaxy S23" || phoneName == "Galaxy S22" || phoneName == "Galaxy S21 FE 5G" || phoneName == "Galaxy Z Flip3 5G" {
                sizeTextField.text = s23_size[row]
            } else {
                sizeTextField.text = google_size[row]
            }
            
            sizeTextField.resignFirstResponder()
            
        case 2:
            if phoneName == "iPhone 14 Pro Max" {
                colorTextField.text = iPhone14Pro_color[row]
                //Change product image when user choosing different color
                if colorTextField.text == "Deep Purple" {
                    phoneImageView.image = UIImage(named: "iPhone14ProMax_DeepPurple")
                } else if colorTextField.text == "Space Black" {
                    phoneImageView.image = UIImage(named: "iPhone14ProMax_SpaceBlack")
                } else if colorTextField.text == "Gold" {
                    phoneImageView.image = UIImage(named: "iPhone14ProMax_Gold")
                } else {
                    phoneImageView.image = UIImage(named: "iPhone14ProMax_Silver")
                }
                
            } else if phoneName == "iPhone 14 Pro" {
                colorTextField.text = iPhone14Pro_color[row]
                if colorTextField.text == "Deep Purple" {
                    phoneImageView.image = UIImage(named: "iPhone14Pro_DeepPurple")
                } else if colorTextField.text == "Space Black" {
                    phoneImageView.image = UIImage(named: "iPhone14Pro_SpaceBlack")
                } else if colorTextField.text == "Gold" {
                    phoneImageView.image = UIImage(named: "iPhone14Pro_Gold")
                } else {
                    phoneImageView.image = UIImage(named: "iPhone14Pro_Silver")
                }
                
            } else if phoneName == "iPhone 14" {
                colorTextField.text = iPhone14_color[row]
                if colorTextField.text == "Purple" {
                    phoneImageView.image = UIImage(named: "iPhone14_Purple")
                } else if colorTextField.text == "Blue" {
                    phoneImageView.image = UIImage(named: "iPhone14_Blue")
                } else if colorTextField.text == "Yellow" {
                    phoneImageView.image = UIImage(named: "iPhone14_Yellow")
                } else if colorTextField.text == "Starlight" {
                    phoneImageView.image = UIImage(named: "iPhone14_Starlight")
                } else if colorTextField.text == "Midnight" {
                    phoneImageView.image = UIImage(named: "iPhone14_Midnight")
                } else {
                    phoneImageView.image = UIImage(named: "iPhone14_Red")
                }
                
            } else if phoneName == "iPhone 14 Plus" {
                colorTextField.text = iPhone14_color[row]
                if colorTextField.text == "Purple" {
                    phoneImageView.image = UIImage(named: "iPhone14Plus_Purple")
                } else if colorTextField.text == "Blue" {
                    phoneImageView.image = UIImage(named: "iPhone14Plus_Blue")
                } else if colorTextField.text == "Yellow" {
                    phoneImageView.image = UIImage(named: "iPhone14Plus_Yellow")
                } else if colorTextField.text == "Starlight" {
                    phoneImageView.image = UIImage(named: "iPhone14Plus_Starlight")
                } else if colorTextField.text == "Midnight" {
                    phoneImageView.image = UIImage(named: "iPhone14Plus_Midnight")
                } else {
                    phoneImageView.image = UIImage(named: "iPhone14Plus_Red")
                }
                
            } else if phoneName == "iPhone 13" {
                colorTextField.text = iPhone13_color[row]
                if colorTextField.text == "Pink" {
                    phoneImageView.image = UIImage(named: "iphone13_pink")
                } else if colorTextField.text == "Blue" {
                    phoneImageView.image = UIImage(named: "iphone13_blue")
                } else if colorTextField.text == "Green" {
                    phoneImageView.image = UIImage(named: "iphone13_green")
                } else if colorTextField.text == "Starlight" {
                    phoneImageView.image = UIImage(named: "iphone13_starlight")
                } else if colorTextField.text == "Midnight" {
                    phoneImageView.image = UIImage(named: "iphone13_midnight")
                } else {
                    phoneImageView.image = UIImage(named: "iphone13_red")
                }
                
            } else if phoneName == "iPhone 13 Mini" {
                colorTextField.text = iPhone13_color[row]
                if colorTextField.text == "Pink" {
                    phoneImageView.image = UIImage(named: "iphone13mini_pink")
                } else if colorTextField.text == "Blue" {
                    phoneImageView.image = UIImage(named: "iphone13mini_blue")
                } else if colorTextField.text == "Green" {
                    phoneImageView.image = UIImage(named: "iphone13mini_green")
                } else if colorTextField.text == "Starlight" {
                    phoneImageView.image = UIImage(named: "iphone13mini_starlight")
                } else if colorTextField.text == "Midnight" {
                    phoneImageView.image = UIImage(named: "iphone13mini_midnight")
                } else {
                    phoneImageView.image = UIImage(named: "iphone13mini_red")
                }
                
            } else if phoneName == "iPhone 12" {
                colorTextField.text = iPhone12_color[row]
                if colorTextField.text == "Purple" {
                    phoneImageView.image = UIImage(named: "iphone12_purple")
                } else if colorTextField.text == "Blue" {
                    phoneImageView.image = UIImage(named: "iphone12_blue")
                } else if colorTextField.text == "Green" {
                    phoneImageView.image = UIImage(named: "iphone12_green")
                } else if colorTextField.text == "White" {
                    phoneImageView.image = UIImage(named: "iphone12_white")
                } else if colorTextField.text == "Black" {
                    phoneImageView.image = UIImage(named: "iphone12_black")
                } else {
                    phoneImageView.image = UIImage(named: "iphone12_red")
                }
                
            } else if phoneName == "iPhone SE" {
                colorTextField.text = iPhoneSE_color[row]
                if  colorTextField.text == "Starlight" {
                    phoneImageView.image = UIImage(named: "iphoneSE_starlight")
                } else if colorTextField.text == "Midnight" {
                    phoneImageView.image = UIImage(named: "iphoneSE_midnight")
                } else {
                    phoneImageView.image = UIImage(named: "iphoneSE_red")
                }
                
            } else if phoneName == "Pixel 7 Pro" {
                colorTextField.text = pixel7Pro_color[row]
            } else if phoneName == "Pixel 7" {
                colorTextField.text = pixel7_color[row]
            } else if phoneName == "Pixel 6a" {
                colorTextField.text = pixel6a_color[row]
            } else if phoneName == "Pixel 6" {
                colorTextField.text = pixel6_color[row]
            } else if phoneName == "Pixel 6 Pro" {
                colorTextField.text = pixel6Pro_color[row]
            } else if phoneName == "Galaxy S23 Ultra" {
                colorTextField.text = s23Ultra_color[row]
            } else if phoneName == "Galaxy S23+" || phoneName == "Galaxy S23" {
                colorTextField.text = s23_color[row]
            } else if phoneName == "Galaxy S22 Ultra" {
                colorTextField.text = s22Ultra_color[row]
            } else if phoneName == "Galaxy S22" {
                colorTextField.text = s22_color[row]
            } else if phoneName == "Galaxy Z Fold4" {
                colorTextField.text = fold4_color[row]
            } else if phoneName == "Galaxy Z Flip4" {
                colorTextField.text = flip4_color[row]
            } else if phoneName == "Galaxy S21 FE 5G" {
                colorTextField.text = s21_color[row]
            } else {
                colorTextField.text = color[row]
            }
            
            colorTextField.resignFirstResponder()
        default:
            return
        }
    }

    @IBAction func onBtnContinueTouchUpInside(_ sender: UIButton) {
        let order = PhoneOrder()
        order.model = phoneName
        order.price = phonePrice
        order.storage = sizeTextField.text!
        order.color = colorTextField.text!
        
        if sizeTextField.text!.isEmpty || colorTextField.text!.isEmpty {
            errorLabel.isHidden = false
            errorLabel.text = "Please select the storage size and color."
        } else {
            if let toVC = storyboard?.instantiateViewController(identifier:"ConfirmationViewController") as? ConfirmationViewController {
                toVC.setOrder(order: order)
                self.navigationController?.pushViewController(toVC, animated: true)
            }
        }
    }
}

