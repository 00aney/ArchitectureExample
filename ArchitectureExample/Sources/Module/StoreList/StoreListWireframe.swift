//
//  StoreListWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol StoreListWireframeProtocol: class {
  func presentStoreListModule(from caller: AnyObject, city: City)
  func presentStoreDetailModule(store: Store)
  
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}


class StoreListWireframe: StoreListWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  var storeDetailWireframe: StoreDetailWireframe?
  
  weak var storeListViewController: UIViewController?
  
  func presentStoreListModule(from caller: AnyObject, city: City) {
    let storeService = StoreService()
    
    // Generating module components
    guard let view = UIStoryboard(name: "StoreListViewController", bundle: nil).instantiateViewController(withIdentifier: "StoreListViewController") as? StoreListViewController else {
      return
    }
    
    storeListViewController = view
    
    let presenter = StoreListPresenter()
    let interactor = StoreListInteractor(storeService: storeService)
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireframe = self
    presenter.city = city
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    if let navigationController = caller as? UINavigationController {
      navigationController.pushViewController(view, animated: true)
    }
  }
  
  func presentStoreDetailModule(store: Store) {
    guard let navigationController = storeListViewController?.navigationController else { return }
    storeDetailWireframe?.presentStoreDetailModule(from: navigationController, store: store)
  }
  
}
