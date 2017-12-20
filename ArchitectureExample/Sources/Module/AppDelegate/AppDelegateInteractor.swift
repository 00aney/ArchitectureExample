//
//  AppDelegateInteractor.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol AppDelegateInteractorInputProtocol {
  var presenter: AppDelegateInteractorOutputProtocol? { get set }
  
  /**
   * Add here your methods for communication PRESENTER -> INTERACTOR
   */
}


class AppDelegateInteractor: AppDelegateInteractorInputProtocol {
  
  var presenter: AppDelegateInteractorOutputProtocol?
  
}
