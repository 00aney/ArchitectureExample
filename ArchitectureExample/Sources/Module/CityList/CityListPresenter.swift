//
//  CityListPresenter.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 19..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation

protocol CityListPresenterProtocol: class {
  
}


protocol CityListInteractorOutputProtocol: class {
  
}


class CityListPresenter: CityListPresenterProtocol {
  weak var view: CityListViewProtocol?
}


extension CityListPresenter: CityListInteractorOutputProtocol {
  
}
