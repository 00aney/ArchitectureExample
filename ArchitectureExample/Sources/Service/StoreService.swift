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
  func storesNearBy(lat: Double, lon: Double, completion: @escaping ((ServiceResult<PagedStore.Store>)->Void))
}


final class StoreService: StoreServiceType {
  
  static let APIKey = "MDo3MmI5NDU1OC1lMmRkLTExZTctYWQ0Ni1jYjgxMWM4NzczMzc6UXBiNlZTVGlxQjREdmdhYVFhRkE5OEk3ZDZFckxBcGt0YU9O"
  
  func storesNearBy(lat: Double, lon: Double, completion: @escaping ((ServiceResult<PagedStore.Store>)->Void)) {
    var urlRequest: URLRequest
    urlRequest = URLRequest(url: URL(string: "https://lcboapi.com/stores")!)
    urlRequest.addValue("Token \(StoreService.APIKey)", forHTTPHeaderField: "Authorization")
    
    let parameters: Parameters = [
      "lat": lat,
      "lon": lon,
    ]
    
    let encodedURLRequest = try! URLEncoding.queryString.encode(urlRequest, with: parameters)
    Alamofire.request(encodedURLRequest)
      .responseData { response in
        switch response.result {
        case .success(let data):
          let result = try! JSONDecoder().decode(PagedStore.self, from: data)
          print(result)
          
//          JSONDecoder.decode(<#T##JSONDecoder#>)
        case .failure(let error):
          print(error)
        }
    }
  }
  
}
