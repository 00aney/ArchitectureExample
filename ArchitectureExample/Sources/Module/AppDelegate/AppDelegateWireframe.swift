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
  func presentStoreListModule(lat: Double, lon: Double)
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
  
  func presentStoreListModule(lat: Double, lon: Double) {
    storeListWireframe?.presentStoreListModule(from: self, lat: lat, lon: lon)
  }
  
  func presentTabBarModule() {
    
  }
  
}
