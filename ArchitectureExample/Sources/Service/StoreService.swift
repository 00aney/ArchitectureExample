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
  func storesNearBy(city: String, lat: Double, lon: Double, pagingURL: URL?, completion: @escaping ((ServiceResult<List<Store>>) -> Void))
}


final class StoreService: StoreServiceType {
  
  static let APIKey = "MDo3MmI5NDU1OC1lMmRkLTExZTctYWQ0Ni1jYjgxMWM4NzczMzc6UXBiNlZTVGlxQjREdmdhYVFhRkE5OEk3ZDZFckxBcGt0YU9O"
  
  static let baseURL = "https://lcboapi.com"
  
  func storesNearBy(city: String, lat: Double, lon: Double, pagingURL: URL? = nil, completion: @escaping ((ServiceResult<List<Store>>)) -> Void) {
    var urlRequest: URLRequest
    urlRequest = URLRequest(url: pagingURL ?? URL(string: "https://lcboapi.com/stores")!)
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
          
          var nextURL: URL? = nil
          if let nextURLPath = result.pager.nextURL {
            nextURL = URL(string: StoreService.baseURL + nextURLPath)
          }
          let stores = result.stores.filter{ $0.city == city }
          let list = List<PagedStore.Store>(items: stores, nextURL: nextURL)
          completion(ServiceResult<List<Store>>.success(list))
        case .failure(let error):
          completion(ServiceResult<List<Store>>.failure(error))
        }
    }
  }
  
}
