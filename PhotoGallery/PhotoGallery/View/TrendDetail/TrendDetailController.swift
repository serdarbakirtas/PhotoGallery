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
    private var indicator: UIView!
    @IBOutlet private var buttonClose: UIButton!
    @IBOutlet private var imageZoom: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!

    var viewModel: PhotoDetailViewModel! {
        didSet {
            _ = self.view

            scrollView.delegate = self

            guard let fullImage = viewModel.fullImage else {
                return
            }

            indicator = UIViewController.displaySpinner(onView: view)
            
            imageZoom.kf.setImage(with: fullImage, placeholder: nil, options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ], progressBlock: nil) { image, error, cashe, url in
                UIViewController.removeSpinner(spinner: self.indicator)
                self.buttonClose.isHidden = false
                
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
