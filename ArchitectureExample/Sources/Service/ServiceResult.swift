//
//  ServiceResult.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 18..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import Foundation


enum ServiceResult<T> {
  case success(T)
  case failure(Error)
}


enum ServiceError: Error {
  case error
}
