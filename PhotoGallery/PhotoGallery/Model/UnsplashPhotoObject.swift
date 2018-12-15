//
//  UnsplashPhotoObject.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation

struct UnsplashPhotoObject: Decodable {
    struct URLStack: Decodable {
        var regular: String
        var thumb: String
        var small: String
        var full: String
    }

    struct User: Decodable {
        var id: String
        var username: String
    }

    var urls: URLStack
    var width: Int
    var height: Int
    var likes: Int
    var id: String
    var user: User
    var created_at: String
    var updated_at: String
}

// map Unsplash photo model to our gallery model
extension UnsplashPhotoObject: PhotoObject {
    var username: String {
        return user.username
    }

    var thumbnailImagePath: String {
        return urls.thumb
    }

    var regularImagePath: String {
        return urls.regular
    }
    
    var fullImagePath: String {
        return urls.full
    }
}
