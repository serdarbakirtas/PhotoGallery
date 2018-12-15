//
//  TrendPhotosController.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TrendPhotosController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var viewModel: TrendPhotoRepresentable! {
        didSet {
            guard viewModel != nil else {
                return
            }

            viewModel.didUpdate = {
                self.collectionView.reloadData()
            }

            viewModel.didFail = {}

            _ = self.view
            try? viewModel.prepare()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        viewModel.setCollectionBounds(view.frame.size)
        layout.minimumLineSpacing = viewModel.collectionLineSpacing
        layout.sectionInset = viewModel.collectionInset
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

    var layout: UICollectionViewFlowLayout {
        return self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.cellSize(at: indexPath.row)
    }
}
