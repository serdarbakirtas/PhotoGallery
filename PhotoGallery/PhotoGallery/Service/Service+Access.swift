//
//  Service+Access.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation

protocol UnsplashCredentials {}

extension UnsplashCredentials {
    public var headers: [String: String]? {
        switch self {
        case _:
            return ["Authorization": "Client-ID " + AppConfig.ApiKey]
        }
    }
}
