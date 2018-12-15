//
//  PhotosService.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import Moya

public enum PhotosService {
    case trendPhotos(page: Int)
}

extension PhotosService: TargetType, UnsplashCredentials {
    public var baseURL: URL {
        return URL(string: AppConfig.UnsplashURL)!
    }
    
    public var path: String {
        switch self {
        case .trendPhotos:
            return "/photos"
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
    public var method: Moya.Method {
        switch self {
        case .trendPhotos:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .trendPhotos:
            return try! Data(resource: R.file.photos)
        }
    }
    
    public var task: Task {
        switch self {
        case let .trendPhotos(page: page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.default)
        }
    }
}
