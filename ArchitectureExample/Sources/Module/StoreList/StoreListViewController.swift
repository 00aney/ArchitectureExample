//
//  StoreListViewController.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol StoreListViewProtocol: class {
  
}


final class StoreListViewController: UIViewController {
  
  var presenter: StoreListPresenterProtocol?
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupBinding()
    
    presenter?.viewDidLoad()
  }
  
  private func setupUI() {
    print("setupUI")
  }
  
  private func setupBinding() {
    print("setupBinding")
  }
}


extension StoreListViewController: StoreListViewProtocol {
  
}

