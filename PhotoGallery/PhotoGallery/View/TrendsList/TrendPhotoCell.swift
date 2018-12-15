//
//  TrendPhotoCell.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Kingfisher
import UIKit

class TrendPhotoCell: UICollectionViewCell {
    var viewModel: TrendCellViewModel! {
        didSet {
            guard viewModel != nil else {
                return
            }

            imagePhoto.kf.setImage(with: viewModel.thumbnailImage)
            labelTitle.text = viewModel.username
        }
    }

    @IBOutlet var imagePhoto: UIImageView!
    @IBOutlet var labelTitle: UILabel!
}
