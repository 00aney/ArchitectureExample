//
//  AppDelegateWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol AppDelegateWireframeProtocol: class {
  func presentAppDelegateModule(from caller: AnyObject)
  
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
  func presentCityListModule()
  func presentStoreListModule()
  func presentTabBarModule()
}


class AppDelegateWireframe: AppDelegateWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  
  // TODO: Other wire frame
  var cityListWireframe: CityListWireframe?
  var storeListWireframe: StoreListWireframe?
  
  func presentAppDelegateModule(from caller: AnyObject) {
  }
  
  func presentCityListModule() {
    cityListWireframe?.presentCityListModule(from: self)
  }
  
  func presentStoreListModule() {
    storeListWireframe?.presentStoreListModule(from: self)
  }
  
  func presentTabBarModule() {
    
  }
  
}
