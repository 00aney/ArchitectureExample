//
//  StoreListWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol StoreListWireframeProtocol: class {
  func presentStoreListModule(fromView caller: AnyObject)
  
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}


class StoreListWireframe: StoreListWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  
  func presentStoreListModule(fromView caller: AnyObject) {
    guard let viewController = UIStoryboard(name: "StoreListViewController", bundle: nil).instantiateInitialViewController() as? StoreListViewController else { return }
    
    rootWireframe?.transitionToViewController(viewController: viewController)
  }
  
}
