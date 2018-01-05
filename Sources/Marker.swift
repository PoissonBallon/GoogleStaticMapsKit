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

public enum MarkerSize: String {
  case tiny, mid, small
}

public enum MarkerAnchor: String {
  case top, bottom, left, right, center, topleft, topright, bottomleft, bottomright
}

public enum MarkerColor: String {
  case black, brown, green, purple, yellow, blue, gray, orange, red, white
}

public struct Marker {
  public let size: MarkerSize?
  public let color: MarkerColor?
  public let label: String?
  public let icon: URL?
  public let anchor: MarkerAnchor?
  public let location: [LocationCenter]!

  public init(location: [LocationCenter], icon: URL? = nil, anchor: MarkerAnchor? = nil) {
    self.location = location
    self.icon = icon
    self.anchor = anchor
    self.size = nil
    self.color = nil
    self.label = nil
  }

  public init(location: [LocationCenter], color: MarkerColor? = nil, label: String? = nil, size: MarkerSize? = nil) {
    self.location = location
    self.icon = nil
    self.anchor = nil
    self.size = size
    self.color = color
    self.label = label
  }

  var apiLine: String {
    var apiLine = [String]()
    if let size = size { apiLine.append("size:\(size.rawValue)") }
    if let color = color { apiLine.append("color:\(color.rawValue)") }
    if let anchor = anchor { apiLine.append("anchor:\(anchor.rawValue)") }
    if
      let label = label?.uppercased(),
      let first = label.unicodeScalars.first,
      CharacterSet.alphanumerics.contains(first) {
      apiLine.append("label:\(first)")
    }
    if let icon = icon { apiLine.append("icon:\(icon.absoluteString)") }
    self.location.forEach { apiLine.append($0.value) }
    return apiLine.joined(separator: "|")
  }
}
