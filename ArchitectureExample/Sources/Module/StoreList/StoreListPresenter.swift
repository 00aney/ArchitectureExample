//
//  StoreListPresenter.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreListPresenterProtocol: class {
  func viewDidLoad()
}


protocol StoreListInteractorOutputProtocol: class {
  
}


final class StoreListPresenter {
  
  // MARK: Properties
  
  weak var view: StoreListViewProtocol?
  var wireframe: StoreListWireframeProtocol?
  var interactor: StoreListInteractorInputProtocol?
  
  var lat: Double?
  var lon: Double?
}


// MARK: - StoreListPresenterProtocol

extension StoreListPresenter: StoreListPresenterProtocol {
  
  func viewDidLoad() {
    print("viewDidLoad")
    interactor?.fetchStores(lat: lat!, lon: lon!)
  }
  
}


// MARK: - StoreListInteractorOutputProtocol

extension StoreListPresenter: StoreListInteractorOutputProtocol {
  
}
