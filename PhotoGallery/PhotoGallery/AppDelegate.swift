//
//  AppDelegate.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Moya
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white

        AppConfig.configure(application: application, launchOptions: launchOptions ?? [:])
        window?.rootViewController = R.storyboard.trends().instantiateInitialViewController()

        return true
    }
}
