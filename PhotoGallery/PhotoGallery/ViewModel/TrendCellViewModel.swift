//
//  TrendCellViewModel.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit
class TrendCellViewModel {
    var model: PhotoObject
    
    init(model: PhotoObject) {
        self.model = model
    }
    
    var thumbnailImage: ImageResource? {
        guard let url = URL(string: model.thumbnailImagePath) else {
            return nil
        }
        
        return ImageResource(downloadURL: url)
    }
    
    var regularImage: ImageResource? {
        guard let url = URL(string: model.regularImagePath) else {
            return nil
        }
        
        return ImageResource(downloadURL: url)
    }
    
    var width: Int {
        return model.width
    }
    
    var height: Int {
        return model.height
    }
    
    var likes: Int {
        return model.likes
    }
    
    var id: String {
        return model.id
    }
    
    var username: String {
        return model.username
    }
}
