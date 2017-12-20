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
    let cityListWireframe = CityListWireframe()
    cityListWireframe.rootWireframe = rootWireframe
    
    // StoreList wireframe
    
    // StoreDetail wireframe
    
    // AppDelegate wireframe
    let appDelegateWireframe = AppDelegateWireframe()
    appDelegateWireframe.cityListWireframe = cityListWireframe
    appDelegateWireframe.rootWireframe = rootWireframe
    
    let appDelegateInteractor = AppDelegateInteractor()
    let appDelegatePresenter = AppDelegatePresenter()
    appDelegatePresenter.wireframe = appDelegateWireframe
    appDelegatePresenter.interactor = appDelegateInteractor
    appDelegateInteractor.presenter = appDelegatePresenter
    
    appDelegatePresenter.presentRootViewController()
  }

}

