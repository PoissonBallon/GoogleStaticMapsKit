import Foundation
import Cocoa
import PlaygroundSupport
import GoogleStaticMapsKit

GoogleStaticMaps.setAPIKey(apiKey: "Your API_KEY")

let locationCenter = LocationCenter.geo(latitude: 45.7772, longitude: 3.0870)
let imageSize = ImageSize(width: 200, height: 200)
let point = Location(center: locationCenter, zoom: .city)
let setting = Parameters(size: imageSize)
let gsm = GoogleStaticMaps(point: point, setting: setting)
let url = gsm.toURL


Utils.getDataFromUrl(url: url) { (data, response, error) in
  if let data = data {
    let image = NSImage(data: data)
  }
}

PlaygroundPage.current.needsIndefiniteExecution = true










struct Utils {
  static func getDataFromUrl(url: URL?, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    guard let url = url else { completion(nil, nil, nil); return }
    URLSession.shared.dataTask(with: url) { data, response, error in completion(data, response, error) }.resume()
  }
}




