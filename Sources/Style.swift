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

// Custom struct for https://forums.developer.apple.com/thread/80288
public struct AnyDecodable: Decodable {
  var value: Any
  var valueStr: String

  public init(from decoder: Decoder) throws {
    if let int = try? Int(from: decoder) {
      value = int
      valueStr = String(int)
    } else if let double = try? Double(from: decoder) {
      value = double
      valueStr = String(double)
    } else {
      let string = try String(from: decoder)
      value = string
      valueStr = string
    }
  }
}

public struct Style: Codable {
  public let feature: String?
  public let element: String?
  public let stylers: [[String: AnyDecodable]]

  enum CodingKeys: String, CodingKey {
    case feature = "featureType"
    case element = "elementType"
    case stylers = "stylers"
    case style = "style"
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.feature = try values.decodeIfPresent(String.self, forKey: .feature)
    self.element = try values.decodeIfPresent(String.self, forKey: .element)
    self.stylers = try values.decode([[String: AnyDecodable]].self, forKey: .stylers)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.apiLine, forKey: .style)
  }

  var apiLine: String {
    var apiLine = [String]()
    if let feature = feature { apiLine.append("feature:\(feature)") }
    if let element = element { apiLine.append("element:\(element)") }
    self.stylers
      .forEach {
        $0.forEach {
          let key = $0.key
          let value = $0.value.valueStr.replacingOccurrences(of: "#", with: "0x")
          apiLine.append("\(key):\(value)")
        }
    }
    return apiLine.joined(separator: "|")
  }

}
