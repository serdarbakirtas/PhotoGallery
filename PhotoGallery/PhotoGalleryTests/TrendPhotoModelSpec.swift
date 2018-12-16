//
//  TrendPhotoModelSpec.swift
//  PhotoGalleryTests
//
//  Created by Hasan Serdar on 16.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import Moya
import Nimble
import Quick

@testable import PhotoGallery

class TrendPhotoModelSpec: QuickSpec {
    override func spec() {
        var sut: TrendPhotoViewModel!
        beforeEach {
            let provider = MoyaProvider<PhotosService>(stubClosure: MoyaProvider.immediatelyStub)
            let model = TrendPhotoModel(provider: provider)
            sut = TrendPhotoViewModel(model: model)
        }
        
        it("should has empty offers before launch") {
            expect(sut.model.photos).to(beEmpty())
        }
        
        it("should has data after fetch") {
            expect(sut.model.photos).notTo(beNil())
        }
        
        it("should has array items count", closure: {
            sut.didUpdate = {
                expect(sut.itemsCount()).notTo(equal(0))
            }
            try! sut.prepare()
        })
        
        it("should has photo array", closure: {
            sut.didUpdate = {
                expect(sut.model.photos.first).notTo(beNil())
            }
            try! sut.prepare()
        })
        
        it("should has photo full image path", closure: {
            sut.didUpdate = {
                expect(sut.model.photos.first!.fullImagePath).to(equal("https://images.unsplash.com/photo-1544828116-28790ab0a418?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQ2NTg3fQ"))
            }
            try! sut.prepare()
        })
        
        it("should has photo thumbnail image path", closure: {
            sut.didUpdate = {
                expect(sut.model.photos.first!.thumbnailImagePath).to(equal("https://images.unsplash.com/photo-1544828116-28790ab0a418?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjQ2NTg3fQ"))
            }
            try! sut.prepare()
        })
        
        it("should has photo regular image path", closure: {
            sut.didUpdate = {
                expect(sut.model.photos.first!.regularImagePath).to(equal("https://images.unsplash.com/photo-1544828116-28790ab0a418?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjQ2NTg3fQ"))
            }
            try! sut.prepare()
        })
        
        it("should has photo id", closure: {
            sut.didUpdate = {
                expect(sut.model.photos.first!.id).to(equal("ax2CvGLRTw8"))
            }
            try! sut.prepare()
        })
        
        it("should has user object", closure: {
            sut.didUpdate = {
                expect(sut.model.photos.first!.user).toNot(beNil())
            }
            try! sut.prepare()
        })
        
        it("should has urls object", closure: {
            sut.didUpdate = {
                expect(sut.model.photos.first!.urls).toNot(beNil())
            }
            try! sut.prepare()
        })
        
        it("should has pagination", closure: {
            sut.didUpdate = {
                expect(sut.model.fetchNext()).toNot(beNil())
            }
            try! sut.prepare()
        })
        
        it("should has width height", closure: {
            sut.didUpdate = {
                expect(sut.model.photos.first!.height).to(equal(5246))
                expect(sut.model.photos.first!.width).to(equal(4160))
            }
            try! sut.prepare()
        })
    }
}
