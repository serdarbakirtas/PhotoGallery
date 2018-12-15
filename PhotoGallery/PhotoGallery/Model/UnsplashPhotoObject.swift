//
//  UnsplashPhotoObject.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation

struct UnsplashPhotoObject: Decodable {
    var id: String
//    var created_at: Date
//    var updated_at: Date
//    var width: Int
//    var height: Int
}

// map Unsplash photo model to our gallery model
extension UnsplashPhotoObject: PhotoObject {
    var thumbnail: String {
        return ""
    }
}
