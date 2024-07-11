//
//  UICollectionView+Extension.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

extension UICollectionView {
    static func flowLayout(spacing: CGFloat, numberOfCellsInRow: CGFloat, heightMultiplier: CGFloat = 1, scrollDirection: ScrollDirection = .horizontal) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.scrollDirection = scrollDirection
        let length = (ScreenSize.width - (spacing * (2 + numberOfCellsInRow - 1))) / numberOfCellsInRow
        
        layout.itemSize = CGSize(width: length, height: length * heightMultiplier)
        print(layout.itemSize)
        return layout
    }
}
