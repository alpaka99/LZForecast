//
//  ThreeHourForecastCell.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class ThreeHourForecastCell: BaseTableViewCell {
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionView.flowLayout(
            spacing: 10,
            numberOfCellsInRow: 5,
            heightMultiplier: 2,
            scrollDirection: .horizontal
        )
    )
    
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        contentView.addSubview(collectionView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
            $0.height.equalTo(200)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
    }
}
