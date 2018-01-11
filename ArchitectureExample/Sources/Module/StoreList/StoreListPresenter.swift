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
  func didSelectTableViewRowAt(indexPath: IndexPath)
  func configureCell(_ cell: StoreListCell, for indexPath: IndexPath)
}


protocol StoreListInteractorOutputProtocol: class {
  func storesFetched(stores: [Store])
}


final class StoreListPresenter {
  
  // MARK: Properties
  
  weak var view: StoreListViewProtocol?
  var wireframe: StoreListWireframeProtocol?
  var interactor: StoreListInteractorInputProtocol?
  
  var city: City?
  
  var stores = [Store]()
}


// MARK: - StoreListPresenterProtocol

extension StoreListPresenter: StoreListPresenterProtocol {
  
  func viewDidLoad() {
    interactor?.fetchStores(city: city!)
  }
  
  func numberOfRows(in section: Int) -> Int {
    return stores.count
  }
  
  func configureCell(_ cell: StoreListCell, for indexPath: IndexPath) {
    let store = stores[indexPath.row]
    cell.configure(name: store.name, address: store.address1, phone: store.phone)
  }
  
  func didSelectTableViewRowAt(indexPath: IndexPath) {
    wireframe?.presentStoreDetailModule(store: stores[indexPath.row])
  }
  
}


// MARK: - StoreListInteractorOutputProtocol

extension StoreListPresenter: StoreListInteractorOutputProtocol {
  
  func storesFetched(stores: [Store]) {
    self.stores.append(contentsOf: stores)
    view?.show()
  }
  
}
