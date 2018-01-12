//
//  StoreDetailPresenter.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


protocol StoreDetailPresenterProtocol: class {
  var view: StoreDetailViewProtocol? { get set }
  var wireframe: StoreDetailWireframeProtocol? { get set }
  var interactor: StoreDetailInteractorInputProtocol? { get set }
  
  // VIEW -> PRESENTER
  func viewDidLoad()
}


protocol StoreDetailInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
}


final class StoreDetailPresenter {
  weak var view: StoreDetailViewProtocol?
  var wireframe: StoreDetailWireframeProtocol?
  var interactor: StoreDetailInteractorInputProtocol?
  
  var store: Store?
}


// MARK: - StoreDetailPresenterProtocol

extension StoreDetailPresenter: StoreDetailPresenterProtocol {
  
  func viewDidLoad() {
    if let store = store {
      view?.displayStoreDetail(store: store)
    } else {
      //fetch store
    }
  }
  
}


// MARK: - StoreDetailInteractorOutputProtocol

extension StoreDetailPresenter: StoreDetailInteractorOutputProtocol {
  
}


