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

public struct ImageSize {
  public let width: Int
  public let height: Int
}

public enum ImageFormat: String {
  case png
  case png32
  case gif
  case jpg
  case jpgBaseline = "jpg-baseline"
}

public enum SettingMapType: String {
  case roadmap
  case satellite
  case terrain
  case hybrid
}

public struct Parameters: Encodable {
  public let size: ImageSize
  public let scale: Int?
  public let format: ImageFormat?
  public let mapType: SettingMapType?
  public let language: String?
  public let region: String?

  public init(size: ImageSize, scale: Int? = nil, format: ImageFormat? = nil,
              mapType: SettingMapType? = nil, language: String? = nil, region: String? = nil) {
    self.size = size
    self.scale = scale
    self.format = format
    self.mapType = mapType
    self.language = language
    self.region = region
  }

  enum CodingKeys: String, CodingKey {
    case size
    case scale
    case format
    case maptype
    case language
    case region
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    let str = "\(Int(size.width))x\(Int(size.height))"
    try container.encode(str, forKey: .size)
    try container.encodeIfPresent(scale, forKey: .scale)
    try container.encodeIfPresent(format?.rawValue, forKey: .format)
    try container.encodeIfPresent(mapType?.rawValue, forKey: .maptype)
    try container.encodeIfPresent(language, forKey: .language)
    try container.encodeIfPresent(region, forKey: .region)
  }
}
