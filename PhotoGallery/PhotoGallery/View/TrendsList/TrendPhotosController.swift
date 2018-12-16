//
//  TrendPhotosController.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import UIKit
import Moya

class TrendPhotosController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var viewModel: TrendPhotoRepresentable! {
        didSet {
            guard viewModel != nil else {
                return
            }

            viewModel.didUpdate = { [weak self] in
                guard let `self` = self else {
                    return
                }
                self.collectionView.reloadData()
            }

            viewModel.didFail = { [weak self] in
                guard let `self` = self else {
                    return
                }

                if let message = self.viewModel.lastErrorMessage {
                    self.showMessage("", message, callback: nil)
                }
            }

            _ = self.view
            try? viewModel.prepare()
        }
    }
    
    let trendPhotoViewModel: TrendPhotoViewModel = {
        let model = TrendPhotoModel(provider: MoyaProvider<PhotosService>())
        let vm = TrendPhotoViewModel(model: model)
        return vm
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = trendPhotoViewModel
        
        layout.delegate = self
        let spacing = viewModel.collectionSpacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.headerHeight = 0

        viewModel.setCollectionBounds(view.frame.size)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // Before rotation
        print(view.safeAreaLayoutGuide.layoutFrame.size)

        collectionView.alpha = 0
        coordinator.animate(alongsideTransition: { context in
        }) { context in
            // After rotation
            print(self.view.safeAreaLayoutGuide.layoutFrame.size)
            self.viewModel.setCollectionBounds(self.view.safeAreaLayoutGuide.layoutFrame.size)
            self.collectionView.reloadData()

            UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1, animations: {
                self.collectionView.alpha = 1
            }).startAnimation()
        }
    }

    var layout: WaterfallLayout {
        return self.collectionView.collectionViewLayout as! WaterfallLayout
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewModel?.itemsCount() ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.trendPhotoCell, for: indexPath)!

        cell.viewModel = viewModel.cellViewModel(at: indexPath.row)

        return cell
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + scrollView.frame.size.height
        let contentHeight = scrollView.contentSize.height

        if offsetY - contentHeight > 40 {
            viewModel.fetch()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let trendDetail = R.storyboard.trendDetail.trendDetailController()!
        trendDetail.viewModel = viewModel.detailModel(at: indexPath.row)
        self.present(trendDetail, animated: true, completion: nil)
    }
}

extension TrendPhotosController: WaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.cellSize(at: indexPath.row)
    }

    func collectionViewLayout(for section: Int) -> WaterfallLayout.Layout {
        if viewModel.isLandscape {
            return .waterfall(column: 4, distributionMethod: WaterfallLayout.DistributionMethod.balanced)
        } else {
            return .waterfall(column: 2, distributionMethod: WaterfallLayout.DistributionMethod.balanced)
        }
    }
}
