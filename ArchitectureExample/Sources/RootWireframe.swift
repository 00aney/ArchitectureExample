//
//  RootWireframe.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit

class RootWireframe {
  var window: UIWindow!
  
  func showRootViewController(viewController: UIViewController) {
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
  
  func transitionToViewController(viewController: UIViewController) {
    if let rootViewController = window.rootViewController {
      UIView.transition(
        from: rootViewController.view,
        to: viewController.view,
        duration: 0.65,
        options: .transitionCrossDissolve
      ) { _ in
        self.window.rootViewController = viewController
      }
    } else {
      showRootViewController(viewController: viewController)
    }
  }
  
}
