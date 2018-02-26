//
//  Capital.swift
//  GSMExample
//
//  Created by Allan Vialatte on 26/02/2018.
//  Copyright © 2018 Allan Vialatte. All rights reserved.
//

import Foundation

struct Capital: Codable {
  let type: String
  let geometry: Geometry
  let properties: Properties
  
  var longitude: Double {
    return geometry.coordinates[0]
  }
  
  var latitude: Double {
    return geometry.coordinates[1]
  }
  
  struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
  }
  
  struct Properties: Codable {
    let capital: String
    let country: String
  }
}


extension Capital {
  static func loadAllCapital() -> [Capital] {
    let decoder = JSONDecoder()
    let continent = ["africa", "asia", "europe","north-america","oceania", "south-america"]
    let paths = continent.flatMap { Bundle.main.path(forResource: $0, ofType: "json") }.flatMap { URL(fileURLWithPath: $0) }
    let datas = paths.flatMap { try? Data(contentsOf: $0) }
    let capitals = datas.flatMap { try? decoder.decode([Capital].self, from: $0) }.flatMap { $0 }
    return capitals
  }
}
