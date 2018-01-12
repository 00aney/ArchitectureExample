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
  
  //Add here your methods for communication PRESENTER -> WIREFRAME
  func presentCityListModule()
}


class AppDelegateWireframe: AppDelegateWireframeProtocol {
  
  var rootWireframe: RootWireframe?
  
  var cityListWireframe: CityListWireframe?
  
  func presentAppDelegateModule(from caller: AnyObject) {
  }
  
  func presentCityListModule() {
    cityListWireframe?.presentCityListModule(from: self)
  }
}
