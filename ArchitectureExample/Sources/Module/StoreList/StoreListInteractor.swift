//
//  StoreListInteractor.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreListInteractorInputProtocol: class {
  var presenter: StoreListInteractorOutputProtocol? { get set }
  
  // PRESENTER -> INTERACTOR
  func fetchStores(city: City)
}


final class StoreListInteractor {
  
  // MARK: Properties
  
  weak var presenter: StoreListInteractorOutputProtocol?
  var storeService: StoreServiceType?
  var nextURL: URL? = nil
  
  
  // MARK: Initializing
  
  init(storeService: StoreServiceType) {
    self.storeService = storeService
  }
  
}


// MARK: - StoreListInteractorInputProtocol

extension StoreListInteractor: StoreListInteractorInputProtocol {
  
  func fetchStores(city: City) {
    storeService?.storesNearBy(city: city.name, lat: city.location.coordinate.latitude, lon: city.location.coordinate.longitude, pagingURL: nextURL) { [weak self] result in
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
