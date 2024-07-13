//
//  ThreeHourForecastCell.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class ThreeHourForecastCell: BaseTableViewCell {
    let title = {
        let label = UILabel()
        label.text = "3시간마다 알림"
        return label
    }()
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
        
        contentView.addSubview(title)
        contentView.addSubview(collectionView)
        
    }
    
    override func configureLayout() {
        super.configureLayout()
        title.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(contentView)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(contentView)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        collectionView.backgroundColor = .blue
    }
}
