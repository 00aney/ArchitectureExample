//
//  Store.swift
//  ArchitectureExample
//
//  Created by aney on 2018. 1. 2..
//  Copyright © 2018년 Ted Kim. All rights reserved.
//

import Foundation


struct Store: Codable {
  let name: String
}

//{
//  "status": 200,
//  "message": null,
//  "pager": {
//    "records_per_page": 20,
//    "total_record_count": 657,
//    "current_page_record_count": 20,
//    "is_first_page": true,
//    "is_final_page": false,
//    "current_page": 1,
//    "current_page_path": "/stores?lat=43.65838&lon=-79.44335&page=1",
//    "next_page": 2,
//    "next_page_path": "/stores?lat=43.65838&lon=-79.44335&page=2",
//    "previous_page": null,
//    "previous_page_path": null,
//    "total_pages": 33,
//    "total_pages_path": "/stores?lat=43.65838&lon=-79.44335&page=33"
//  },
//  "result": [
//  {
//  "id": 534,
//  "is_dead": false,
//  "name": "Dundas & Bloor",
//  "tags": "dundas bloor 2290 street west toronto central toronto-central torontocentral m6r1x3",
//  "address_line_1": "2290 Dundas Street West",
//  "address_line_2": null,
//  "city": "Toronto",
//  "postal_code": "M6R1X3",
//  "telephone": "(416) 537-1500",
//  "fax": "(416) 537-1502",
//  "latitude": 43.6553,
//  "longitude": -79.4508,
//  "products_count": 2220,
//  "inventory_count": 35244,
//  "inventory_price_in_cents": 61311794,
//  "inventory_volume_in_milliliters": 26355351,
//  "has_wheelchair_accessability": true,
//  "has_bilingual_services": true,
//  "has_product_consultant": true,
//  "has_tasting_bar": false,
//  "has_beer_cold_room": false,
//  "has_special_occasion_permits": false,
//  "has_vintages_corner": true,
//  "has_parking": false,
//  "has_transit_access": true,
//  "sunday_open": 660,
//  "sunday_close": 1080,
//  "monday_open": 600,
//  "monday_close": 1260,
//  "tuesday_open": 600,
//  "tuesday_close": 1260,
//  "wednesday_open": 600,
//  "wednesday_close": 1260,
//  "thursday_open": 600,
//  "thursday_close": 1260,
//  "friday_open": 600,
//  "friday_close": 1260,
//  "saturday_open": 600,
//  "saturday_close": 1260,
//  "updated_at": "2018-01-02T14:16:06.145Z",
//  "distance_in_meters": 685,
//  "store_no": 534
//  }]
//}

