//
//  SearchCityCell.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import UIKit

import SnapKit

final class SearchCityCell: BaseTableViewCell {
    let icon = {
        let image = UIImageView()
        image.image = UIImage(systemName: "globe")
        return image
    }()
    let cityName = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    let country = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        contentView.addSubview(icon)
        contentView.addSubview(cityName)
        contentView.addSubview(country)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        icon.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading)
                .offset(8)
            $0.verticalEdges.equalTo(contentView)
                .inset(16)
            $0.width.equalTo(icon.snp.height)
        }
        
        cityName.snp.makeConstraints {
            $0.leading.equalTo(icon.snp.trailing)
                .offset(8)
            $0.top.equalTo(contentView.snp.top)
                .offset(8)
        }
        
        country.snp.makeConstraints {
            $0.leading.equalTo(cityName.snp.leading)
                .offset(8)
            $0.top.equalTo(cityName.snp.bottom)
                .offset(8)
            $0.bottom.equalTo(contentView.snp.bottom)
                .offset(-8)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        contentView.backgroundColor = .black
    }
    
    func configureData(_ data: City) {
        cityName.text = data.name
        country.text = data.country
    }
}
