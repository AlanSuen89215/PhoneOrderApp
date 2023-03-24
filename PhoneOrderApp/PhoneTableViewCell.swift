//
//  PhoneTableViewCell.swift
//  PhoneOrderApp
//
//  Created by Po Lam Wong on 21/3/2023.
//

import UIKit

class PhoneTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var phoneModel: UILabel!
    @IBOutlet weak var phonePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
