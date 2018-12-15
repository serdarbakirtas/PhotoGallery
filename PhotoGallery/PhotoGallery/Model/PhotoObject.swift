//
//  PhotoObject.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation

protocol PhotoObject {
    var thumbnailImagePath: String { get }
    var regularImagePath: String { get }
    var width: Int { get }
    var height: Int { get }
    var likes: Int { get }
    var id: String { get }
    var username: String { get }
}
