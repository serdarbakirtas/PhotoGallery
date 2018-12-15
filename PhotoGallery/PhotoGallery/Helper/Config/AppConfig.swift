//
//  AppConfig.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import UIKit

@objc
public class AppConfig: NSObject {
    static var UnsplashURL: String = ""
    static var ApiKey: String = ""
    
    static var application: UIApplication!
    
    static var isDebug: Bool = false
    static var isRelease: Bool = false
    static var isStaging: Bool = false
    
    static func configure(application: UIApplication, launchOptions _: [AnyHashable: Any]) {
        self.application = application
        loadFromPlist()
    }
    
    /// If you need more environments, you can use this method
    ///
    /// Please check plist. You can find base url in these plists.
    static func loadFromPlist() {
        var resourceName: String = "DEBUG"
        
        #if RELEASE
        isRelease = true
        
        #endif
        
        #if STAGING
        isStaging = true
        #endif
        
        #if DEBUG
        isDebug = true
        #endif
        
        switch (isDebug, isStaging, isRelease) {
        case (false, false, true):
            resourceName = "RELEASE"
            
        case (true, true, false):
            resourceName = "STAGING"
            
        case (true, false, false):
            resourceName = "DEBUG"
            
        default:
            break
        }
        
        let path = Bundle.main.path(forResource: resourceName, ofType: "plist")!
        let content = NSDictionary(contentsOfFile: path) as? Dictionary<String, Any> ?? [:]
        UnsplashURL = content["UnsplashURL"] as! String
        ApiKey = content["ApiKey"] as! String
    }
}
