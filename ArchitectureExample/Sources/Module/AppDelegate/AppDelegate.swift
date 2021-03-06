//
//  AppDelegate.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 17..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    setupAppWireframe()
    
    return true
  }
  
  private func setupAppWireframe() {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let rootWireframe = RootWireframe()
    rootWireframe.window = window
    
    // CityList wireframe
    let cityListWireframe = CityListWireframe.createMudule()
    cityListWireframe.rootWireframe = rootWireframe
    
    // StoreList wireframe
    let storeListWireframe = StoreListWireframe()
    storeListWireframe.rootWireframe = rootWireframe
    cityListWireframe.storeListWireframe = storeListWireframe

    // StoreDetail wireframe
    let storeDetailWireframe = StoreDetailWireframe()
    storeDetailWireframe.rootWireframe = rootWireframe
    storeListWireframe.storeDetailWireframe = storeDetailWireframe
    
    // AppDelegate wireframe
    let appDelegateWireframe = AppDelegateWireframe()
    appDelegateWireframe.cityListWireframe = cityListWireframe
    appDelegateWireframe.rootWireframe = rootWireframe
    
    let appDelegatePresenter = AppDelegatePresenter()
    appDelegatePresenter.wireframe = appDelegateWireframe
    
    appDelegatePresenter.presentRootViewController()
  }

}
