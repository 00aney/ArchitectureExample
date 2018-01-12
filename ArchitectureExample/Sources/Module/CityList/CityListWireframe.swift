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
  
  //Add here your methods for communication PRESENTER -> WIREFRAME
  func presentStoreListModule(city: City)
}


final class CityListWireframe: CityListWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  var storeListWireframe: StoreListWireframe?
  
  weak var cityListNavigationController: UINavigationController?
  
  static func createMudule(cityService: CityServiceType? = nil) -> CityListWireframe {
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
    let interactor = CityListInteractor(cityService: cityService ?? CityService())
    
    view.presenter = presenter
    presenter.view = view
    presenter.wireframe = wireframe
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    wireframe.cityListNavigationController = navigationController
    
    return wireframe
  }
  
  func presentCityListModule(from caller: AnyObject) {
    guard let navigationController = cityListNavigationController else { return }
    rootWireframe?.transitionToViewController(viewController: navigationController)
  }
  
  func presentStoreListModule(city: City) {
    guard let navigationController = cityListNavigationController else { return }
    storeListWireframe?.presentStoreListModule(from: navigationController, city: city)
  }
  
}
