//
//  TrendDetailController.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Kingfisher
import UIKit

class TrendDetailController: UIViewController {
    @IBOutlet var imageZoom: UIImageView!
    @IBOutlet var scrollView: UIScrollView!

    var viewModel: PhotoDetailViewModel! {
        didSet {
            _ = self.view

            scrollView.delegate = self

            guard let fullImage = viewModel.fullImage else {
                return
            }

            imageZoom.kf.setImage(with: fullImage, placeholder: nil, options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ], progressBlock: nil) { image, error, cashe, url in
                let frame = self.scrollView.frame
                let widthScale = image!.size.width / frame.width
                let heightScale = image!.size.height / frame.height
                let minScale = min(widthScale, heightScale)
                self.scrollView.minimumZoomScale = minScale
                DispatchQueue.main.async {
                    self.scrollView.zoomScale = minScale
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension TrendDetailController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageZoom
    }
}
