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
  
  static func createMudule(cityService: CityServiceType) -> CityListWireframe {
    guard let navigationController = UIStoryboard(name: "CityListViewController", bundle: nil).instantiateInitialViewController() as? UINavigationController
      else {
        fatalError("Failed to initialize ViewController")
    }
    
    guard let view = navigationController.viewControllers.first
      as? CityListViewController else {
        fatalError("Failed to initialize ViewController")
    }
    
    let wireframe = CityListWireframe()
    let presenter = CityListPresenter()
    let interactor = CityListInteractor(cityService: cityService)
    
    view.presenter = presenter
    presenter.view = view
    presenter.wireframe = wireframe
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    wireframe.cityListViewController = view
    
    return wireframe
  }
  
  func presentCityListModule(from caller: AnyObject) {
    rootWireframe?.transitionToViewController(viewController: cityListViewController)
  }
  
}
