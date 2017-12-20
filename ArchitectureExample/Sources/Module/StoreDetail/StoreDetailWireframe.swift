//
//  StoreDetailWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol StoreDetailWireframeProtocol: class {
  func presentStoreDetailModule(fromView caller: AnyObject)
  
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}


class StoreDetailWireframe: StoreDetailWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  
  func presentStoreDetailModule(fromView caller: AnyObject) {
    guard let viewController = UIStoryboard(name: "StoreDetailViewController", bundle: nil).instantiateInitialViewController() as? StoreDetailViewController else { return }
    
    rootWireframe?.transitionToViewController(viewController: viewController)
  }
  
}

