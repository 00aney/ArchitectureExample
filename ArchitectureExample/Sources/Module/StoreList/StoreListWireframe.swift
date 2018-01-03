//
//  StoreListWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol StoreListWireframeProtocol: class {
  func presentStoreListModule(from caller: AnyObject, lat: Double, lon: Double)
  
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}


class StoreListWireframe: StoreListWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  
  weak var storeListViewController: UIViewController?
  
//  var storeService: StoreService?
  
  static func createMudule(storeService: StoreServiceType = StoreService()) -> StoreListWireframe {
    guard let view = UIStoryboard(name: "StoreListViewController", bundle: nil).instantiateViewController(withIdentifier: "StoreListViewController") as? StoreListViewController
      else {
        fatalError("Failed to initialize ViewController")
    }
    
    let wireframe = StoreListWireframe()
    let presenter = StoreListPresenter()
    let interactor = StoreListInteractor(storeService: storeService)
    
    view.presenter = presenter
    presenter.view = view
    presenter.wireframe = wireframe
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    wireframe.storeListViewController = view
    
    return wireframe
  }
  
  func presentStoreListModule(from caller: AnyObject, lat: Double, lon: Double) {
//    guard let storeService = storeService else { return }
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
    presenter.lat = lat
    presenter.lon = lon
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    if let navigationController = caller as? UINavigationController {
      navigationController.pushViewController(view, animated: true)
    }
  }
  
}
