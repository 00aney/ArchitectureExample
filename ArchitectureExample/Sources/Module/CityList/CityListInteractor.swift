//
//  CityListInteractor.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 19..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol CityListInteractorInputProtocol: class {
  // INTERACTOR -> PRESENTER
  func fetchCities()
}


final class CityListInteractor {
  
  // MARK: Properties
  
  weak var presenter: CityListInteractorOutputProtocol?
  var cityService: CityServiceType?
  
  
  // MARK: Initializing
  
  init(cityService: CityServiceType) {
    self.cityService = cityService
  }
  
}


// MARK: - CityListInteractorInputProtocol

extension CityListInteractor: CityListInteractorInputProtocol {
  
  func fetchCities() {
    cityService?.cities { [weak self] result in
      guard let `self` = self else { return }
      switch result {
      case .success(let cities):
        print(cities)
        self.presenter?.citiesFetched(cities: cities)
      case .failure(let error):
        print(error)
      }
    }
  }
  
}
