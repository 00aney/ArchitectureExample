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
  
  func numberOfRows(in section: Int) -> Int
}


protocol StoreListInteractorOutputProtocol: class {
  func storesFetched(stores: [Store])
}


final class StoreListPresenter {
  
  // MARK: Properties
  
  weak var view: StoreListViewProtocol?
  var wireframe: StoreListWireframeProtocol?
  var interactor: StoreListInteractorInputProtocol?
  
  var lat: Double?
  var lon: Double?
  
  var stores = [Store]()
}


// MARK: - StoreListPresenterProtocol

extension StoreListPresenter: StoreListPresenterProtocol {
  
  func viewDidLoad() {
    print("viewDidLoad")
    interactor?.fetchStores(lat: lat!, lon: lon!)
  }
  
  func numberOfRows(in section: Int) -> Int {
    return stores.count
  }
  
}


// MARK: - StoreListInteractorOutputProtocol

extension StoreListPresenter: StoreListInteractorOutputProtocol {
  
  func storesFetched(stores: [Store]) {
    self.stores.append(contentsOf: stores)
    view?.show()
  }
  
}
