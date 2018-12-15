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
        var message = "Service Error Occured."
        if let moyaError = error as? MoyaError {
            switch moyaError {
            case .imageMapping:
                message = "image mapping error"
                
            case .jsonMapping:
                message = "json mapping error"
                
            case .stringMapping:
                message = "string mapping error"
                
            case let .objectMapping(error, _):
                message = error.localizedDescription
                
            case let .encodableMapping(error):
                message = error.localizedDescription
                
            case .statusCode:
                message = error.localizedDescription
                
            case let .underlying(error, response):
                do {
                    if let response = try response?.mapJSON() as? [String: Any], let errorMessage = (response["errors"] as? [String])?.first {
                        message = errorMessage
                    } else {
                        message = error.localizedDescription
                    }
                    
                } catch let error {
                    message = error.localizedDescription
                }
                
            case let .requestMapping(string):
                message = string
                
            case let .parameterEncoding(error):
                message = error.localizedDescription
            }
        } else {
            message = error.localizedDescription
        }
        
        self.showMessage("", message, callback: nil)
    }
}
