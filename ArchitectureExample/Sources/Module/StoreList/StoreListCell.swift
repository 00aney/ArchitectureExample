//
//  StoreListCell.swift
//  ArchitectureExample
//
//  Created by aney on 2018. 1. 9..
//  Copyright © 2018년 Ted Kim. All rights reserved.
//

import UIKit


final class StoreListCell: UITableViewCell {

  // MARK: UI
  
  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var storeNameLabel: UILabel!
  
  
  // MARK: Configuring
  
  func configure(name: String, address: String, phone: String) {
    storeNameLabel.text = name
    addressLabel.text = address
    phoneLabel.text = phone
  }
  
}
