//
//  AppDelegate.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-18.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        let rootVC = DemoViewController()
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
        
        return true
    }
}
