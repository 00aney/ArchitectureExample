//
//  StoreDetailPresenter.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreDetailPresenterProtocol: class {
  
}


protocol StoreDetailInteractorOutputProtocol: class {
  
}


class StoreDetailPresenter: StoreDetailPresenterProtocol {
  weak var view: StoreDetailViewProtocol?
}


extension StoreDetailPresenter: StoreDetailInteractorOutputProtocol {
  
}


