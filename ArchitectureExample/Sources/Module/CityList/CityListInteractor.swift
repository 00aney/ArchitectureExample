//
//  CityListInteractor.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 19..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol CityListInteractorInputProtocol: class {
  
}


class CityListInteractor: CityListInteractorInputProtocol {
  weak var presenter: CityListInteractorOutputProtocol?
  
  init() {
    
  }
  
}
