//
//  CityListCell.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 26..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


final class CityListCell: UITableViewCell {
  
  // MARK: UI
  
  @IBOutlet weak var titleLabel: UILabel!

  
  // MARK: Configuring
  
  func configure(_ city: City) {
    titleLabel.text = city.name
  }
  
}
