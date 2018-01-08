//
//  StoreListInteractor.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreListInteractorInputProtocol: class {
  func fetchStores(lat: Double, lon: Double)
}


class StoreListInteractor {
  
  // MARK: Properties
  
  weak var presenter: StoreListInteractorOutputProtocol?
  var storeService: StoreServiceType?
  var nextURL: URL? = nil
  
  init(storeService: StoreServiceType) {
    self.storeService = storeService
  }
  
}


// MARK: - StoreListInteractorInputProtocol

extension StoreListInteractor: StoreListInteractorInputProtocol {
  
  func fetchStores(lat: Double, lon: Double) {
    storeService?.storesNearBy(lat: lat, lon: lon, pagingURL: nextURL) { [weak self] result in
      guard let `self` = self else { return }

      switch result {
      case .success(let list):
        self.nextURL = list.nextURL
        self.presenter?.storesFetched(stores: list.items)
      case .failure(let error):
        print(error)
      }
    }
  }
  
}
