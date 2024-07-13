//
//  SelfSizingCollecitonView.swift
//  LZForecast
//
//  Created by user on 7/12/24.
//

import UIKit

class SelfSizingCollecitonView: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            if oldValue.height != self.contentSize.height {
                invalidateIntrinsicContentSize()
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
