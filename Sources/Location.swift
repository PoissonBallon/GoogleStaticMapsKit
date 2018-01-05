//  MIT License
//
//  Copyright (c) 2018 Vialatte Allan
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import Foundation

public enum LocationCenter {
  case geo(latitude:Double, longitude:Double)
  case address(address: String)

  var value: String {
    switch self {
    case .geo(let latitude, let longitude):   return "\(latitude),\(longitude)"
    case .address(let address):               return address
    }
  }
}

public enum ZoomLevel {
  case world
  case continant
  case city
  case street
  case building
  case custom(value: Int)

  var value: Int {
    switch self {
    case .world:              return 1
    case .continant:          return 5
    case .city:               return 10
    case .street:             return 15
    case .building:           return 20
    case .custom(let value):  return value
    }
  }
}

public struct Location: Encodable {
  public let center: LocationCenter
  public let zoom: ZoomLevel

  public init(center: LocationCenter, zoom: ZoomLevel) {
    self.center = center
    self.zoom = zoom
  }

  enum CodingKeys: String, CodingKey {
    case center
    case zoom
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    try container.encode(center.value, forKey: .center)
    try container.encode(zoom.value, forKey: .zoom)
  }
}
