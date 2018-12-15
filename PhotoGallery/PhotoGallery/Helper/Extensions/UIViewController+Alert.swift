//
//  UIViewController+Alert.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Moya
import UIKit
extension UIViewController {
    func showMessage(_ title: String = "", _ message: String = "", callback: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            callback?()
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError(_ error: Error) {
        self.showMessage("", error.serverErrorDescription, callback: nil)
    }
}
