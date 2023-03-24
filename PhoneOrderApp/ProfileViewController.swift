//
//  ProfileViewController.swift
//  PhoneOrderApp
//
//  Created by Samuel Sum on 2023-03-21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var orderTableView: UITableView!
    
    let status: [String] = ["Confirmed","Delivered"]
    let model: [String] = ["iPhone 14 Pro Max","iPhone 14"]
    let storage: [String] = ["256GB","256GB"]
    let color: [String] = ["Deep Purple","Gold"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return status.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        cell.statusLabel.text = status[indexPath.row]
        cell.modelLabel.text = model[indexPath.row]
        cell.storageLabel.text = storage[indexPath.row]
        cell.colorLabel.text = color[indexPath.row]
        return cell
    }

}
