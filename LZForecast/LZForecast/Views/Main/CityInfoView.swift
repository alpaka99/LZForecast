//
//  CityInfoCell.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class CityInfoView: BaseTableViewCell {
    let cityName = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 52)
        label.text = "Jeju City"
        return label
    }()
    
    let currentTemperature = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 92)
        label.text = "5.9º"
        return label
    }()
    
    let forecastStatus = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        label.text = "Broken Clouds"
        return label
    }()
    
    let endPointTemperature = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        label.text = "최고: \(7.0)º | 최저: \(-4.2)º"
        return label
    }()
    
    lazy var stackView = { [weak self] in
        let stack = UIStackView()
        guard let cell = self else { return stack }
        
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .center
        
        stack.addArrangedSubview(cell.cityName)
        stack.addArrangedSubview(cell.currentTemperature)
        stack.addArrangedSubview(cell.forecastStatus)
        stack.addArrangedSubview(cell.endPointTemperature)
        
        return stack
    }()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.addSubview(stackView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        stackView.snp.makeConstraints {
            $0.edges.equalTo(self)
                .inset(40)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        self.backgroundColor = .clear
    }
}
