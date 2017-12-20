//
//  StoreListPresenter.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreListPresenterProtocol: class {
  
}


protocol StoreListInteractorOutputProtocol: class {
  
}


class StoreListPresenter: StoreListPresenterProtocol {
  weak var view: StoreListViewProtocol?
}


extension StoreListPresenter: StoreListInteractorOutputProtocol {
  
}

