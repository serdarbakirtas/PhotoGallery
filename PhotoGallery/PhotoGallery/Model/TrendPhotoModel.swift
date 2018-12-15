//
//  TrendPhotoModel.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import Moya
import Promises

class TrendPhotoModel {
    var currentPage: Int = 1
    var isBusy = false
    var provider: MoyaProvider<PhotosService>
    var photos: [UnsplashPhotoObject] = []
    
    init(provider: MoyaProvider<PhotosService>) {
        self.provider = provider
    }
    
    func fetchNext() -> Promise<[UnsplashPhotoObject]> {
        isBusy = true
        
        let searchPromise: Promise<[UnsplashPhotoObject]> = provider.promise(PhotosService.trendPhotos(page: currentPage))
        
        // when service call succeeded in future
        searchPromise.then { [weak self] results in
            guard let `self` = self else {
                return
            }
            
            self.photos = self.photos + results
        }.catch { error in
            print(error)
        }.always { [weak self] in
            self?.isBusy = false
        }
        
        return searchPromise
    }
}
