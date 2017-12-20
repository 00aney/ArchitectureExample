//
//  StoreListInteractor.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreListInteractorInputProtocol: class {
  
}


class StoreListInteractor: StoreListInteractorInputProtocol {
  weak var presenter: StoreListInteractorOutputProtocol?
  
  init() {
    
  }
  
}
