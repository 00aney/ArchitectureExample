//
//  CityService.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import CoreLocation
import Foundation


import Alamofire


protocol CityServiceType {
  
  func cities(completion: @escaping (ServiceResult<[City]>) -> ())
  
}


final class CityService: CityServiceType {
  
  static let APIKey = "MDo3MmI5NDU1OC1lMmRkLTExZTctYWQ0Ni1jYjgxMWM4NzczMzc6UXBiNlZTVGlxQjREdmdhYVFhRkE5OEk3ZDZFckxBcGt0YU9O"
  
  static let baseURL = "https://lcboapi.com"
  
  func cities(completion: @escaping (ServiceResult<[City]>) -> ()) {
    
    let cities = [
      City(name: "Ajax", location: CLLocation(latitude: 43.8508553, longitude: -79.0203732)),
      City(name: "Mississauga", location: CLLocation(latitude: 43.5890452, longitude: -79.6441198)),
      City(name: "Toronto", location: CLLocation(latitude: 43.653226, longitude: -79.38318429999998)),
      City(name: "Barrie", location: CLLocation(latitude: 44.38935559999999, longitude: -79.69033159999998)),
      City(name: "Collingwood", location: CLLocation(latitude: 44.50076869999999, longitude: -80.21690469999999)),
    ]
    completion(ServiceResult.success(cities))
  }
  
}
