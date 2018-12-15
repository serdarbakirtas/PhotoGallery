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
    var collectionSpacing: CGFloat { get set }
    var collectionInset: UIEdgeInsets { get set }
    
    // ui api
    var isLandscape: Bool { get }
    var lastErrorMessage: String? { get }
    var visibleCellInRow: CGFloat { get }
    func cellSize(at row: Int) -> CGSize
    func item(at row: Int) -> PhotoObject
    func setCollectionBounds(_ size: CGSize)
    func itemsCount() -> Int
    func cellViewModel(at row: Int) -> TrendCellViewModel
    func detailModel(at row: Int) -> PhotoDetailViewModel
    func fetch()
}

class TrendPhotoViewModel: ViewModel, TrendPhotoRepresentable {
    func detailModel(at row: Int) -> PhotoDetailViewModel {
        return PhotoDetailViewModel(model: item(at: row))
    }
    
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
        fetch()
    }
    
    func fetch() {
        model.fetchNext()?.then { _ in
        }.catch { [weak self] _ in
            self?.didFail?()
        }.always(on: .main) { [weak self] in
            self?.didUpdate?()
        }
    }
    
    // itunes search retuning zero result on empty search string
    var collectionSpacing: CGFloat = 10
    var collectionInset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    var collectionSize: CGSize = UIScreen.main.bounds.size
    
    var isLandscape: Bool {
        return collectionSize.width > collectionSize.height
    }
    
    var visibleCellInRow: CGFloat = 2
    
    func itemsCount() -> Int {
        return model.photos.count
    }
    
    func cellViewModel(at row: Int) -> TrendCellViewModel {
        return TrendCellViewModel(model: item(at: row))
    }
    
    func cellSize(at row: Int) -> CGSize {
        let visibleCellWidth = (collectionSize.width - collectionSpacing * (visibleCellInRow + 1)) / visibleCellInRow
        
        let data = item(at: row)
        let visibleCellHeight = min((CGFloat(data.height) / CGFloat(data.width)) * visibleCellWidth, collectionSize.height - 20)
        
        return CGSize(width: visibleCellWidth, height: visibleCellHeight)
    }
    
    func item(at row: Int) -> PhotoObject {
        return model.photos[row]
    }
    
    func setCollectionBounds(_ size: CGSize) {
        collectionSize = size
    }
    
    var lastErrorMessage: String? {
        return model.lastError?.serverErrorDescription
    }
}
