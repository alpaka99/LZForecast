//
//  MainView.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class MainView: BaseView {
    let background = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        return image
    }()
    
    let cityInfoView = CityInfoView()
    let threeHourForecastView = ThreeHourForecastView()
    let fiveDayForecastView = FiveDayForecastView()
    
    let contentView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let scrollView = UIScrollView()
    
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
        
        contentView.addSubview(cityInfoView)
        contentView.addSubview(threeHourForecastView)
        contentView.addSubview(fiveDayForecastView)
        
        scrollView.addSubview(contentView)
        
        background.addSubview(scrollView)
        background.addSubview(mapButton)
        background.addSubview(bulletListButton)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        background.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        contentView.snp.makeConstraints {
            $0.verticalEdges.equalTo(scrollView)
            $0.horizontalEdges.equalTo(background)
        }
        
        scrollView.frameLayoutGuide.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        cityInfoView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(contentView)
        }
        
        threeHourForecastView.snp.makeConstraints {
            $0.top.equalTo(cityInfoView.snp.bottom)
            $0.horizontalEdges.equalTo(contentView)
            $0.height.equalTo(300)
        }
        
        fiveDayForecastView.snp.makeConstraints {
            $0.top.equalTo(threeHourForecastView.snp.bottom)
            $0.horizontalEdges.equalTo(contentView)
            $0.height.equalTo(500)
            $0.bottom.equalTo(scrollView)
        }
        
        
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.leading.equalTo(self)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
        
        bulletListButton.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.trailing.equalTo(self)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
    }
}
