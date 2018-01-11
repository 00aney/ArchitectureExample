//
//  StoreDetailWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol StoreDetailWireframeProtocol: class {
  func presentStoreDetailModule(from caller: AnyObject, store: Store)
  
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}


class StoreDetailWireframe: StoreDetailWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  
  weak var storeDetailViewController: StoreDetailViewController?
  
  func presentStoreDetailModule(from caller: AnyObject, store: Store) {
    guard let view = UIStoryboard(name: "StoreDetailViewController", bundle: nil).instantiateInitialViewController() as? StoreDetailViewController else { return }
    
    storeDetailViewController = view
    
    let presenter = StoreDetailPresenter()
    let interactor = StoreDetailInteractor()
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireframe = self
    presenter.store = store
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    if let navigationController = caller as? UINavigationController {
      navigationController.pushViewController(view, animated: true)
    }
  }
  
}

