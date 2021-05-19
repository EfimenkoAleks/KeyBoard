//
//  AppDelegate.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 14.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow()
        
        let module = MainWireFrame.create()
 //       let navigation = UINavigationController(rootViewController: module)
        window.rootViewController = module
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    
    
}

