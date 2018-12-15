//
//  ViewModelLifeCycle.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation

protocol ViewModelLiveCycle {
    func prepare() throws
    func retire()
}
