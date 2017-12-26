//
//  CityListCell.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 26..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit

class CityListCell: UITableViewCell {
  
  
  @IBOutlet weak var titleLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
  
  func configure(_ city: City) {
    titleLabel.text = city.name
  }
  
}
