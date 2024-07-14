//
//  FiveDayTableViewCell.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import UIKit

final class FiveDayTableViewCell: BaseTableViewCell {
    let weekDay = {
        let label = UILabel()
        
        return label
    }()
    let icon = {
        let image = UIImageView()
        return image
    }()
    let minTemp = {
        let label = UILabel()
        return label
    }()
    let maxTemp = {
        let label = UILabel()
        return label
    }()
    
    
    override func configureHierarchy() {
        super.configureHierarchy()
        contentView.addSubview(weekDay)
        contentView.addSubview(icon)
        contentView.addSubview(minTemp)
        contentView.addSubview(maxTemp)
    }
    
    override func configureLayout() {
        super.configureLayout()
        weekDay.snp.makeConstraints {
            $0.leading.verticalEdges.equalTo(contentView)
                .inset(8)
        }
        
        icon.snp.makeConstraints {
            $0.leading.equalTo(weekDay.snp.trailing)
                .offset(8)
            $0.verticalEdges.equalTo(contentView)
                .inset(8)
        }
        
        minTemp.snp.makeConstraints {
            $0.leading.equalTo(icon.snp.trailing)
                .offset(8)
            $0.verticalEdges.equalTo(contentView)
                .inset(8)
        }
        
        maxTemp.snp.makeConstraints {
            $0.leading.equalTo(minTemp.snp.trailing)
                .offset(8)
            $0.verticalEdges.equalTo(contentView)
                .inset(8)
            $0.trailing.equalTo(contentView)
                .offset(-8)
        }
    }
    
//    func configureData(_ data: )
}
