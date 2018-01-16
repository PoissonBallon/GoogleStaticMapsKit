//
//  ViewController.swift
//  GSMExample
//
//  Created by Allan Vialatte on 12/01/2018.
//  Copyright © 2018 Allan Vialatte. All rights reserved.
//

import UIKit
import GoogleStaticMapsKit

typealias DataItem = (gsm: GoogleStaticMaps, label: String)

class ViewController: UIViewController {
  
  @IBOutlet weak var ibTableView: UITableView!
  let styles = ExampleMapsStylePath()
  
  var item: TabBarItem!
  
  lazy var data: [DataItem] = {
    switch self.item {
    case .zoom:   return self.zoomData
    case .style:  return self.styleData
    case .marker: return self.markerData
    default:      return [DataItem]()
    }
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.ibTableView.estimatedRowHeight = 230
    self.ibTableView.rowHeight = UITableViewAutomaticDimension
    self.ibTableView.dataSource = self
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}


extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MapsCell") as? MapsCell else { fatalError() }
    let data = self.data[indexPath.row]
    cell.load(with: data.gsm, and: data.label)
    return cell
  }
}


// MARK: - DATA
extension ViewController {
  
  var zoomData: [DataItem] {
    let zooms:[ZoomLevel] = [.world, .continant, .city, .street, .building]
    
    return zooms.flatMap {
      let parameters = Parameters(size: ImageSize(width: 600, height: 400))
      let location = Location(center: .geo(latitude: 45.7772, longitude: 3.0870), zoom: $0)
      let gsm = GoogleStaticMaps(location: location, parameters: parameters)
      return DataItem(gsm,"Zoom : \($0)")
    }
  }
  
  var styleData : [DataItem] {
    let pathStyles: [URL] = [ExampleMapsStylePath.assasinsCreedPath!,
                             ExampleMapsStylePath.lostInTheDesertPath!,
                             ExampleMapsStylePath.retroPath!,
                             ExampleMapsStylePath.whiteYellowPath!]
    
    return pathStyles.flatMap {
      let parameters = Parameters(size: ImageSize(width: 600, height: 400))
      let location = Location(center: .geo(latitude: 45.7772, longitude: 3.0870), zoom: .street)
      let styles = StylesImporter.fromJson(path: $0).styles
      let feature = Feature(styles: styles)
      let gsm = GoogleStaticMaps(location: location, parameters: parameters, feature: feature)
      return DataItem(gsm, "Style : \($0.lastPathComponent)")
    }
  }
  
  var markerData: [DataItem] {
    return [DataItem]()
  }
}

// MARK: - Style
struct ExampleMapsStylePath {
  
  static var lostInTheDesertPath: URL? = {
    guard let path = Bundle.main.path(forResource: "lost-in-the-desert", ofType: "json") else { return nil }
    return URL(fileURLWithPath: path)
  }()
  
  static var assasinsCreedPath: URL? = {
    guard let path = Bundle.main.path(forResource: "assasins-creed", ofType: "json") else { return nil }
    return URL(fileURLWithPath: path)
  }()
  
  static var whiteYellowPath: URL? = {
    guard let path = Bundle.main.path(forResource: "white-yellow", ofType: "json") else { return nil }
    return URL(fileURLWithPath: path)
  }()
  
  static var retroPath: URL? = {
    guard let path = Bundle.main.path(forResource: "retro", ofType: "json") else { return nil }
    return URL(fileURLWithPath: path)
  }()
}
