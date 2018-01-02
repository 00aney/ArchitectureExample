//
//  StoreListPresenter.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreListPresenterProtocol: class {
  func viewDidLoad()
}


protocol StoreListInteractorOutputProtocol: class {
  
}


final class StoreListPresenter {
  
  // MARK: Properties
  
  weak var view: StoreListViewProtocol?
  var wireframe: StoreListWireframeProtocol?
  var interactor: StoreListInteractorInputProtocol?
  
}


// MARK: - StoreListPresenterProtocol

extension StoreListPresenter: StoreListPresenterProtocol {
  
  func viewDidLoad() {
    print("viewDidLoad")
    interactor?.fetchStores()
  }
  
}


// MARK: - StoreListInteractorOutputProtocol

extension StoreListPresenter: StoreListInteractorOutputProtocol {
  
}
