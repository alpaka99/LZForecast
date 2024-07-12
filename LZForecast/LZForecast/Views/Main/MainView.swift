//
//  MainView.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class MainView: BaseView {
    let scrollView = UIScrollView()
    
    let background = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        return image
    }()
    
    let cityInfo = CityInfoView()
    let threeHourForecastView = ThreeHourForecastView()
    let fiveDayForecastView = FiveDayForecastView()
    
    lazy var stackView = { [weak self] in
        let stack = UIStackView()
        guard let view = self else { return stack }
        stack.axis = .vertical
        stack.alignment = .center
        
        stack.addArrangedSubview(view.cityInfo)
        stack.addArrangedSubview(view.threeHourForecastView)
        stack.addArrangedSubview(view.fiveDayForecastView)
        
        return stack
    }()
    
    let mapButton = {
        var button = UIButton()
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "star")
        
        button.configuration = config
        
        return button
    }()

    let bulletListButton = {
        var button = UIButton()
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "person")
        
        button.configuration = config
        
        return button
    }()

    override func configureHierarchy() {
        super.configureHierarchy()
        self.addSubview(background)
        background.addSubview(scrollView)
        scrollView.addSubview(stackView)
        self.addSubview(mapButton)
        self.addSubview(bulletListButton)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        background.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        stackView.snp.makeConstraints {
            $0.verticalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide)
        }
//        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
        
        bulletListButton.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.trailing.equalTo(scrollView.snp.trailing)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
    }
    
    
    override func configureUI() {
        super.configureUI()
    }
}
