//
//  StoreService.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation

import Alamofire


protocol StoreServiceType {
  
  
  func storesNearBy(lat: Double, lon: Double, completion: @escaping ((ServiceResult<Store>)->Void))
}


final class StoreService: StoreServiceType {
  
  func storesNearBy(lat: Double, lon: Double, completion: @escaping ((ServiceResult<Store>)->Void)) {
    // TODO: alamofire
  }
  
}
