//
//  MapCell.swift
//  LZForecast
//
//  Created by user on 7/13/24.
//

import UIKit

import SnapKit

final class MapCell: BaseTableViewCell {
    let title = {
        let label = UILabel()
        label.text = "위치"
        return label
    }()
    let image = {
        let image = UIImageView()
        image.image = UIImage(systemName: "background")
        return image
    }()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        contentView.addSubview(title)
        contentView.addSubview(image)
    }
    
    override func configureLayout() {
        super.configureLayout()
        title.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(contentView)
        }
        image.snp.makeConstraints {
            $0.width.equalTo(contentView)
                .multipliedBy(0.6)
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.height.equalTo(image.snp.width)
            $0.top.equalTo(title.snp.bottom)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        image.backgroundColor = .systemBlue
    }
}
