//
//  PhoneViewController.swift
//  PhoneOrderApp
//
//  Created by Samuel Sum on 2023-03-21.
//

import UIKit

class PhoneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var phone_model = [["iPhone 14 Pro Max", "iPhone 14 Pro","iPhone 14 Plus","iPhone 14","iPhone 13 Mini","iPhone 13","iPhone 12","iPhone SE"], ["Pixel 7 Pro","Pixel 7","Pixel 6a","Pixel 6", "Pixel 6 Pro"],["Galaxy S23 Ultra","Galaxy S23+","Galaxy S23","Galaxy A14 5G","Galaxy S22 Ultra","Galaxy S22","Galaxy Z Fold4","Galaxy Z Flip4","Galaxy S21 FE 5G","Galaxy Z Flip3 Bespoke Edition","Galaxy Z Flip3 5G"]]
    var phone_image = [["iPhone 14 Pro Max", "iPhone 14 Pro","iPhone 14 Plus","iPhone 14","iPhone 13 Mini","iPhone 13","iPhone 12","iPhone SE"], ["Pixel 7 Pro","Pixel 7","Pixel 6a","Pixel 6", "Pixel 6 Pro"],["Galaxy S23 Ultra","Galaxy S23+","Galaxy S23","Galaxy A14 5G","Galaxy S22 Ultra","Galaxy S22","Galaxy Z Fold4","Galaxy Z Flip4","Galaxy S21 FE 5G","Galaxy Z Flip3 Bespoke Edition","Galaxy Z Flip3 5G"]]
    var phone_price = [["From $1549","From $1399","From $1249","From $1099","From $849","From $999","From $849","From $579"],["From $1179","From $599","From $599","From $799", "From $1179"],["From $1899.99","From 1559.99","From $1179.99","From $329.99","From $1129.99","From $969.99","From $2269.99","From $1259.99","From $819.99","From $1399.99","From $1209.99"]]
    
    let cellReuseIdentifier = "cell"
    var currentTableView: Int!
    
    @IBOutlet weak var brandSegmentedControl: UISegmentedControl!
    @IBOutlet weak var phoneTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneTableView.dataSource = self
        phoneTableView.delegate = self
        currentTableView = 0
        
        brandSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        brandSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phone_model[currentTableView].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PhoneTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhoneTableViewCell
        cell.phoneModel.text = phone_model[currentTableView][indexPath.row]
        cell.phonePrice.text = phone_price[currentTableView][indexPath.row]
        cell.phoneImage.image = UIImage(named: phone_image[currentTableView][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let phoneDetails = storyboard?.instantiateViewController(identifier:"PhoneDetailsViewController") as? PhoneDetailsViewController {
            phoneDetails.phoneImage = UIImage(named: phone_image[currentTableView][indexPath.row])!
            phoneDetails.phoneName = phone_model[currentTableView][indexPath.row]
            self.navigationController?.pushViewController(phoneDetails, animated: true)
        }
    }
    
    @IBAction func brandSwitch(_ sender: UISegmentedControl) {
        currentTableView = sender.selectedSegmentIndex
        phoneTableView.reloadData()
    }
}
