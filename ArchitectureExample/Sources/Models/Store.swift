//
//  Store.swift
//  ArchitectureExample
//
//  Created by aney on 2018. 1. 2..
//  Copyright © 2018년 Ted Kim. All rights reserved.
//

import Foundation

typealias Store = PagedStore.Store

struct PagedStore: Codable {
  
  struct Pager: Codable {
    let totalRecordCount: Int
    let currentPage: Int
    let isFirstPage: Bool
    let isFinalPage: Bool
    let nextPage: Int?
    let nextURL: String?
    let totalPage: Int
    
    enum CodingKeys: String, CodingKey {
      case totalRecordCount = "total_record_count"
      case currentPage = "current_page"
      case isFirstPage = "is_first_page"
      case isFinalPage = "is_final_page"
      case nextPage = "next_page"
      case nextURL = "next_page_path"
      case totalPage = "total_pages"
    }
  }
  
  struct Store: Codable {
    let id: Int
    let isDead: Bool
    let name: String
    let address1: String
    let address2: String?
    let city: String
    let phone: String
    
    enum CodingKeys: String, CodingKey {
      case id
      case isDead = "is_dead"
      case name
      case address1 = "address_line_1"
      case address2 = "address_line_2"
      case city
      case phone = "telephone"
    }
  }
  
  let status: Int
  let message: String
  let pager: Pager
  let stores: [Store]
  
  enum CodingKeys: String, CodingKey {
    case status
    case message
    case pager
    case stores = "result"
  }
}


extension PagedStore {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let status = try container.decode(Int.self, forKey: .status)
    let message = try? container.decode(String.self, forKey: .message)
    let pager = try container.decode(Pager.self, forKey: .pager)
    let stores = try container.decode([PagedStore.Store].self, forKey: .stores)
    
    self.init(status: status, message: message ?? "", pager: pager, stores: stores)
  }
}
