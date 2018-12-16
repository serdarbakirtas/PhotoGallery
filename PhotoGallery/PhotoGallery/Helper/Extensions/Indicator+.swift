//
//  Indicator+.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 16.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class func displaySpinner(onView: UIView) -> UIView {
        let spinnerView = UIView(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.clear
        
        let indicatorBg = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 100))
        indicatorBg.backgroundColor = UIColor.lightGray
        indicatorBg.alpha = 0.7
        indicatorBg.center = spinnerView.center
        indicatorBg.layer.cornerRadius = CGFloat(10)
        indicatorBg.clipsToBounds = true
        
        let ai = UIActivityIndicatorView(style: .whiteLarge)
        ai.startAnimating()
        ai.center = indicatorBg.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(indicatorBg)
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner: UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
