//
//  FiveDayForecastTableViewCell.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import UIKit

import SnapKit

final class FiveDayForecastTableViewCell: BaseTableViewCell {
    let weekday = {
        let label = UILabel()
        
        return label
    }()
    let icon = {
        let imageView = UIImageView()
        return imageView
    }()
    let minDegree = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()
    let maxDegree = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        contentView.addSubview(weekday)
        contentView.addSubview(icon)
        contentView.addSubview(minDegree)
        contentView.addSubview(maxDegree)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        weekday.snp.makeConstraints {
            $0.leading.verticalEdges.equalTo(contentView)
                .offset(8)
        }
        
        icon.snp.makeConstraints {
            $0.leading.equalTo(weekday.snp.trailing)
                .offset(8)
            $0.verticalEdges.equalTo(contentView)
                .offset(8)
        }
        
        minDegree.snp.makeConstraints {
            $0.leading.equalTo(icon.snp.trailing)
                .offset(8)
            $0.verticalEdges.equalTo(contentView)
                .offset(8)
        }
        
        maxDegree.snp.makeConstraints {
            $0.leading.equalTo(minDegree.snp.trailing)
                .offset(8)
            $0.verticalEdges.trailing.equalTo(contentView)
                .inset(8)
        }
    }
    
    internal func configureData(_ data: FiveDayForecast) {
        print(#function)
        weekday.text = data.weekDay
        icon.image = UIImage(systemName: data.icon)
        minDegree.text = data.minDegree.formatted()
        maxDegree.text = data.maxDegree.formatted()
    }
}
