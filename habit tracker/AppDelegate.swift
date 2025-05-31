//
//  AppDelegate.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 4/29/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // Make sure this is declared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = ViewController() // Your initial view controller
        let navController = UINavigationController(rootViewController: rootVC)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
