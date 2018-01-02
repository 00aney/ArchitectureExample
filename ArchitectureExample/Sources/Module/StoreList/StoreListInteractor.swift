//
//  StoreListInteractor.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreListInteractorInputProtocol: class {
  func fetchStores()
}


class StoreListInteractor {
  
  // MARK: Properties
  
  weak var presenter: StoreListInteractorOutputProtocol?
  var storeService: StoreServiceType?
  
  init(storeService: StoreServiceType) {
    self.storeService = storeService
  }
  
}


// MARK: - StoreListInteractorInputProtocol

extension StoreListInteractor: StoreListInteractorInputProtocol {
  
  func fetchStores() {
    print("DDDD")
  }
  
}
