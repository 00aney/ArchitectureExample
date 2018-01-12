//
//  AppDelegatePresenter.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol AppDelegatePresenterProtocol: class {
  weak var view: AppDelegateViewProtocol? { get set }
  var interactor: AppDelegateInteractorInputProtocol? { get set }
  var wireframe: AppDelegateWireframeProtocol? { get set }
  
  // VIEW -> PRESENTER
  func presentRootViewController()
}


protocol AppDelegateInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
}


final class AppDelegatePresenter: AppDelegatePresenterProtocol {

  weak var view: AppDelegateViewProtocol?
  var interactor: AppDelegateInteractorInputProtocol?
  var wireframe: AppDelegateWireframeProtocol?
  
  func presentRootViewController() {
    wireframe?.presentCityListModule()
  }

}

extension AppDelegatePresenter: AppDelegateInteractorOutputProtocol {
  
}
