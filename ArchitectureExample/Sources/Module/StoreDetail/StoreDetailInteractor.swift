//
//  StoreDetailInteractor.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreDetailInteractorInputProtocol: class {
  
}


class StoreDetailInteractor: StoreDetailInteractorInputProtocol {
  weak var presenter: StoreDetailInteractorOutputProtocol?
  
  init() {
    
  }
  
}

