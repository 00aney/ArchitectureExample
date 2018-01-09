//
//  StoreListCell.swift
//  ArchitectureExample
//
//  Created by aney on 2018. 1. 9..
//  Copyright © 2018년 Ted Kim. All rights reserved.
//

import UIKit

class StoreListCell: UITableViewCell {

  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var storeNameLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  func configure(name: String, address: String, phone: String) {
    storeNameLabel.text = name
    addressLabel.text = address
    phoneLabel.text = phone
  }
}
