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
}


protocol CityListInteractorOutputProtocol: class {
  func citiesFetched()
}


final class CityListPresenter {
  
  // MARK: Properties
  
  weak var view: CityListViewProtocol?
  var wireframe: CityListWireframeProtocol?
  var interactor: CityListInteractorInputProtocol?
  
}


// MARK: - CityListPresenterProtocol

extension CityListPresenter: CityListPresenterProtocol {
  
  func viewDidLoad() {
    view?.showLoadingScreen()
    interactor?.fetchCities()
  }
  
}


// MARK: - CityListInteractorOutputProtocol

extension CityListPresenter: CityListInteractorOutputProtocol {
  
  func citiesFetched() {
    view?.show()
  }
  
}
