//
//  OrderTableViewCell.swift
//  PhoneOrderApp
//
//  Created by Po Lam Wong on 23/3/2023.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var storageLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var phoneImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
