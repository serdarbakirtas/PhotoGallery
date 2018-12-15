//
//  PhotoDetailViewModel.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import Kingfisher

class PhotoDetailViewModel {
    var model: PhotoObject

    init(model: PhotoObject) {
        self.model = model
    }

    var fullImage: URL? {
        return URL(string: model.fullImagePath)
    }
}
