//
//  CityListWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol CityListWireframeProtocol: class {
  func presentCityListModule(from caller: AnyObject)
  
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}


class CityListWireframe: CityListWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  var storeListWireframe: StoreListWireframe?
  
  weak var cityListViewController: UIViewController!
  
  func presentCityListModule(from caller: AnyObject) {
    guard let navigationController = UIStoryboard(name: "CityListViewController", bundle: nil).instantiateInitialViewController() as? UINavigationController else { return }
    
    guard let view = navigationController.viewControllers.first
      as? CityListViewController else {
      return
    }
    
    let presenter = CityListPresenter()
    let interactor = CityListInteractor()
    
    view.presenter = presenter
    presenter.view = view
    presenter.wireframe = self
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    cityListViewController = view
    
    rootWireframe?.transitionToViewController(viewController: view)
  }
  
}
