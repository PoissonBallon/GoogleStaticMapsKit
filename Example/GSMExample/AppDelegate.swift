//
//  AppDelegate.swift
//  GSMExample
//
//  Created by Allan Vialatte on 12/01/2018.
//  Copyright © 2018 Allan Vialatte. All rights reserved.
//

import UIKit
import GoogleStaticMapsKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = TabBarController()
    self.window?.makeKeyAndVisible()
    GoogleStaticMaps.setAPIKey(apiKey: "XxxxxxXXXXxxxxxxx")
    return true
  }
}

