//
//  PhoneViewController.swift
//  PhoneOrderApp
//
//  Created by Samuel Sum on 2023-03-21.
//

import UIKit

class PhoneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let phone_model: [String] = ["iPhone 14 Pro Max", "iPhone 14 Pro","iPhone 14","iPhone 13 Pro Max","iPhone 13 Pro","iPhone 13"]
    
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var phoneTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneTableView.dataSource = self
        phoneTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phone_model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PhoneTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhoneTableViewCell
        cell.phoneModel.text = self.phone_model[indexPath.row]
        return cell
    }
}
