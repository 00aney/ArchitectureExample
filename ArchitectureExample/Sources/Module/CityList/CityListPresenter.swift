//
//  CityListPresenter.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 19..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol CityListPresenterProtocol: class {
  func viewDidLoad()
  
  func numberOfRowsInSection(in section: Int) -> Int
  func configureCell(_ cell: CityListCell, for indexPath: IndexPath)
  
  func didSelectRowAt(indexPath: IndexPath)
}


protocol CityListInteractorOutputProtocol: class {
  func citiesFetched(cities: [City])
}


final class CityListPresenter {
  
  // MARK: Properties
  
  weak var view: CityListViewProtocol?
  var wireframe: CityListWireframeProtocol?
  var interactor: CityListInteractorInputProtocol?
  
  var cities: [City]?
  
}


// MARK: - CityListPresenterProtocol

extension CityListPresenter: CityListPresenterProtocol {
  
  func viewDidLoad() {
    view?.showLoadingScreen()
    interactor?.fetchCities()
  }
  
  func numberOfRowsInSection(in section: Int) -> Int {
    return cities?.count ?? 0
  }
  
  func configureCell(_ cell: CityListCell, for indexPath: IndexPath) {
    guard let cities = cities else { return }
    cell.configure(cities[indexPath.row])
  }
  
  func didSelectRowAt(indexPath: IndexPath) {
    guard let cities = cities else { return }
    wireframe?.presentStoreListModule(city: cities[indexPath.row])
  }
  
}


// MARK: - CityListInteractorOutputProtocol

extension CityListPresenter: CityListInteractorOutputProtocol {
  
  func citiesFetched(cities: [City]) {
    self.cities = cities
    view?.show()
  }
  
}
