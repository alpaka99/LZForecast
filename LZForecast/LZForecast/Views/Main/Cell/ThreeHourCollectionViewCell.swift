//
//  ThreeHourCollectionViewCell.swift
//  LZForecast
//
//  Created by user on 7/13/24.
//

import UIKit

import SnapKit

final class ThreeHourCollectionViewCell: BaseCollectionViewCell {
    let time = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "12시"
        label.textAlignment = .center
        return label
    }()
    let icon = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "star")
        return icon
    }()
    let degree = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "12º"
        label.textAlignment = .center
        return label
    }()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        contentView.addSubview(time)
        contentView.addSubview(icon)
        contentView.addSubview(degree)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        time.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(contentView)
        }
        
        icon.snp.makeConstraints {
            $0.top.equalTo(time.snp.bottom)
            $0.horizontalEdges.equalTo(contentView)
            $0.height.equalTo(icon.snp.width)
        }
        
        degree.snp.makeConstraints {
            $0.top.equalTo(icon.snp.bottom)
            $0.horizontalEdges.equalTo(contentView)
            $0.bottom.equalTo(contentView)
        }
    }
}
