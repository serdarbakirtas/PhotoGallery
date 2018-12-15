//
//  Error+.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import Moya
extension Error {
    var serverErrorDescription: String {
        var message = "Service Error Occured."
        if let moyaError = self as? MoyaError {
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
                message = self.localizedDescription
                
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
            message = self.localizedDescription
        }
        
        return message
    }
}
