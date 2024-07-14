//
//  AdditionalInfoCollectionViewCell.swift
//  LZForecast
//
//  Created by user on 7/14/24.
//

import UIKit

import SnapKit

final class AdditionalInfoCollectionViewCell: BaseCollectionViewCell {
    let title = {
        let label = UILabel()
        label.text = "바람 속도"
        return label
    }()
    let top = {
        let label = UILabel()
        label.text = "1.35m/s"
        return label
    }()
    let middle = {
        let label = UILabel()
        label.text = "hpa"
        return label
    }()
    let bottom = {
        let label = UILabel()
        label.text = "강풍: 4.42m/s"
        return label
    }()
    
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        contentView.addSubview(title)
        contentView.addSubview(top)
        contentView.addSubview(middle)
        contentView.addSubview(bottom)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        title.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(contentView)
        }
        
        top.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom)
            $0.horizontalEdges.equalTo(contentView)
        }
        
        middle.snp.makeConstraints {
            $0.top.equalTo(top.snp.bottom)
            $0.horizontalEdges.equalTo(contentView)
        }
        
        bottom.snp.makeConstraints {
            $0.top.equalTo(middle.snp.bottom)
            $0.horizontalEdges.equalTo(contentView)
            $0.bottom.equalTo(contentView)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        contentView.backgroundColor = .black.withAlphaComponent(0.3)
        contentView.layer.cornerRadius = 8
    }
}
