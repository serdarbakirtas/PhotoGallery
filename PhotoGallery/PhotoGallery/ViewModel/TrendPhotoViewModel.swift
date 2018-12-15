//
//  TrendPhotoViewModel.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import Moya
import UIKit

protocol TrendPhotoRepresentable: ViewModelLiveCycle {
    // it's possible to follow reactive principles to dispatch events by mappable signals.Sake of simplicity and readability I go with named callbacks.
    
    var didUpdate: (() -> ())? { get set }
    var didFail: (() -> ())? { get set }
    
    // config
    var collectionLineSpacing: CGFloat { get set }
    var collectionInset: UIEdgeInsets { get set }
    
    // ui api
    var isLandscape: Bool { get }
    func cellSize(at row: Int) -> CGSize
    func item(at row: Int) -> PhotoObject
    func setCollectionBounds(_ size: CGSize)
    func itemsCount() -> Int
    func cellViewModel(at row: Int) -> TrendCellViewModel
}

class TrendPhotoViewModel: ViewModel, TrendPhotoRepresentable {
    var didFail: (() -> ())?
    var didUpdate: (() -> ())?
    
    private(set) var model: TrendPhotoModel
    
    required init(model: TrendPhotoModel) {
        self.model = model
    }
    
    func retire() {}
    
    /// Prepare model of weather
    func prepare() throws {
//        let model = TrendPhotoModel(provider: MoyaProvider<PhotosService>())
        model.fetchNext().then { _ in
        }.catch { [weak self] _ in
            self?.didFail?()
        }.always(on: .main) { [weak self] in
            self?.didUpdate?()
        }
    }
    
    // itunes search retuning zero result on empty search string
    var collectionLineSpacing: CGFloat = 10
    var collectionInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    var collectionSize: CGSize = UIScreen.main.bounds.size
    
    var isLandscape: Bool {
        return collectionSize.width > collectionSize.height
    }
    
    func itemsCount() -> Int {
        return model.photos.count
    }
    
    func cellViewModel(at row: Int) -> TrendCellViewModel {
        return TrendCellViewModel(model: item(at: row))
    }
    
    func cellSize(at row: Int) -> CGSize {
        if isLandscape {
            return CGSize(width: collectionSize.width - collectionLineSpacing * 2, height: 100)
        } else {
            return CGSize(width: collectionSize.width / 2 - collectionLineSpacing * 2, height: 150)
        }
    }
    
    func item(at row: Int) -> PhotoObject {
        return model.photos[row]
    }
    
    func setCollectionBounds(_ size: CGSize) {
        collectionSize = size
    }
}
