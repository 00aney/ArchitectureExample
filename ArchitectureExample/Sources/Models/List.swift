//
//  List.swift
//  ArchitectureExample
//
//  Created by aney on 2018. 1. 3..
//  Copyright © 2018년 Ted Kim. All rights reserved.
//

import Foundation


struct List<Element> {
  var items: [Element]
  var nextURL: URL?
  
  init(items: [Element], nextURL: URL? = nil) {
    self.items = items
    self.nextURL = nextURL
  }
}
