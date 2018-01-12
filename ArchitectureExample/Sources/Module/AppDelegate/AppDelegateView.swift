//
//  AppDelegateView.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol AppDelegateViewProtocol: class {
  var presenter: AppDelegatePresenterProtocol? { get set }
  // PRESENTER -> VIEW
}

