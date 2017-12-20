//
//  CityListWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol CityListWireframeProtocol: class {
  func presentCityListModule(fromView caller: AnyObject)
  
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}


class CityListWireframe: CityListWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  
  func presentCityListModule(fromView caller: AnyObject) {
    guard let viewController = UIStoryboard(name: "CityListViewController", bundle: nil).instantiateInitialViewController() as? CityListViewController else { return }
    
    rootWireframe?.transitionToViewController(viewController: viewController)
  }
  
}
