//
//  AppDelegate.swift
//  VKFaceRecognizer
//
//  Created by Kazakevich, Vitaly on 9/27/18.
//  Copyright © 2018 Kazakevich, Vitaly. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        let rootViewController = MainRouter().createMainModule()
        let navigation = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}

