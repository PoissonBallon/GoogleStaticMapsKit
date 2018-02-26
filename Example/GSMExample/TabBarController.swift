//
//  TabBarController.swift
//  GSMExample
//
//  Created by Allan Vialatte on 12/01/2018.
//  Copyright © 2018 Allan Vialatte. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  let tabs = [TabBarItem.zoom, TabBarItem.style, TabBarItem.capitals]
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.viewControllers = tabs.flatMap { UINavigationController(rootViewController: $0.viewController) }

  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewControllers = tabs.flatMap { UINavigationController(rootViewController: $0.viewController) }
    self.delegate = self
  }
}

extension TabBarController: UITabBarControllerDelegate {
  
  public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true
  }
}
