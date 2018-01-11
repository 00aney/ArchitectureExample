//
//  StoreDetailViewController.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol StoreDetailViewProtocol: class {
  func displayStoreDetail(store: Store)
}


final class StoreDetailViewController: UIViewController {
  
  var presenter: StoreDetailPresenterProtocol?
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var postalCodeLabel: UILabel!
  @IBOutlet weak var telephoneLabel: UILabel!
  @IBOutlet weak var productCountLabel: UILabel!
  @IBOutlet weak var inventoryCountLabel: UILabel!
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
}


extension StoreDetailViewController: StoreDetailViewProtocol {
  
  func displayStoreDetail(store: Store) {
    nameLabel.text = store.name
    addressLabel.text = store.address1 + (store.address2 ?? "")
    cityLabel.text = store.city
    postalCodeLabel.text = store.postalCode
    telephoneLabel.text = store.phone
    productCountLabel.text = "\(store.productCount)"
    inventoryCountLabel.text = "\(store.inventoryCount)" 
  }
  
}


