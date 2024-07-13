//
//  AdditionalInfoCell.swift
//  LZForecast
//
//  Created by user on 7/13/24.
//

import UIKit

final class AdditionalInfoCell: BaseTableViewCell {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionView.flowLayout(
        spacing: 10,
        numberOfCellsInRow: 2,
        heightMultiplier: 1,
        scrollDirection: .vertical
    ))
    
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        contentView.addSubview(collectionView)
    }
    
    
    override func configureLayout() {
        super.configureLayout()
        
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        collectionView.backgroundColor = .clear
    }
}
