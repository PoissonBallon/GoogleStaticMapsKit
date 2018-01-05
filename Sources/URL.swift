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

extension GoogleStaticMaps {
  
  static let urlScheme = "https"
  static let urlHost = "maps.googleapis.com"
  static let urlPath = "/maps/api/staticmap"
  
  public var toURL: URL? {
    do {
      let url = try self.makeUrl()
      return url
    } catch {
      print("[GoogleStaticMapsKit] can't rendering url with : \(error)")
      return nil
    }
  }
  
  internal func makeUrl() throws -> URL? {
    guard let key = intern_google_static_maps_api_key else { throw GSMError.apiKeyIsNotSet }
    
    var urlComponents = URLComponents()
    urlComponents.scheme = GoogleStaticMaps.urlScheme
    urlComponents.host = GoogleStaticMaps.urlHost
    urlComponents.path = GoogleStaticMaps.urlPath
    
    let keyItem = URLQueryItem(name: "key", value: key)
    
    let centerItem = try self.location.asDictionary()
      .flatMap { queryComponents(fromKey: $0.key, value: $0.value) }
      .flatMap { URLQueryItem(name: $0.0, value: $0.1) }
    
    let settingsItem = try self.parameters.asDictionary()
      .flatMap { queryComponents(fromKey: $0.key, value: $0.value) }
      .flatMap { URLQueryItem(name: $0.0, value: $0.1) }
    
    let componentsItem = try self.feature?.asArray()
      .flatMap { $0 }
      .flatMap { queryComponents(fromKey: $0.key, value: $0.value) }
      .flatMap { URLQueryItem(name: $0.0, value: $0.1) } ?? [URLQueryItem]()
    
    let items = [centerItem, settingsItem, componentsItem, [keyItem]].flatMap { $0 }
    urlComponents.queryItems = items
    
    return urlComponents.url
  }
  
}

internal extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
  
  func asArray() throws -> [[String: Any]] {
    let data = try JSONEncoder().encode(self)
    guard let array = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else {
      throw NSError()
    }
    return array
  }
}
