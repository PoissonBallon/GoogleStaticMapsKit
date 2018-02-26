//
//  TabBarItem.swift
//  GSMExample
//
//  Created by Allan Vialatte on 12/01/2018.
//  Copyright © 2018 Allan Vialatte. All rights reserved.
//

import Foundation
import GoogleStaticMapsKit
import UIKit

enum TabBarItem: String {
  case zoom = "Zoom"
  case style = "Style"
  case capitals = "Capitals"
  
  var viewController: UIViewController {
    let story = UIStoryboard(name: "Main", bundle: nil)
    let vc = story.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    vc.tabBarItem = UITabBarItem(title: self.rawValue, image: nil, selectedImage: nil)
    vc.title = self.rawValue
    vc.item = self
    return vc
  }  
}
