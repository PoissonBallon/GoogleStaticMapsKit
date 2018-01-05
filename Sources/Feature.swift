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

public struct Feature: Encodable {
  public let styles: [Style]?
  public let markers: [Marker]?

  public init(styles: [Style]? = nil, markers: [Marker]? = nil) {
    self.styles = styles
    self.markers = markers
  }

  enum CodingKeys: String, CodingKey {
    case styles = "style"
    case markers = "markers"
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.unkeyedContainer()

    try self.styles?.forEach({ (style) in
      try container.encode([CodingKeys.styles.rawValue: style.apiLine])
    })

    try self.markers?.forEach({ (marker) in
      try container.encode([CodingKeys.markers.rawValue: marker.apiLine])
    })
  }
}
