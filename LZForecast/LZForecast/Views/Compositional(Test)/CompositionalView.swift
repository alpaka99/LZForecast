//
//  MainView.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class CompositionalView: BaseView {
    let background = {
        let image = UIImageView()
        return image
    }()
    
    let cityName = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Jeju City"
        label.font = .systemFont(ofSize: 40, weight: .medium)
        return label
    }()
    
    let currentDegrees = {
        let label = UILabel()
        label.textColor = .white
        label.text = "5.9" + "º"
        label.font = .systemFont(ofSize: 100, weight: .medium)
        return label
    }()
    
    let weatherName = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Broken Clouds"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    let endPointDegrees = {
        let label = UILabel()
        label.textColor = .white
        label.text = "최고: \(7.0) | 최저 \(-4.2)"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private(set) lazy var weatherStatus = { [weak self] in
        let stack = UIStackView()
        guard let vc = self else { return stack}
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.addArrangedSubview(vc.cityName)
        stack.addArrangedSubview(vc.currentDegrees)
        stack.addArrangedSubview(vc.weatherName)
        stack.addArrangedSubview(vc.endPointDegrees)
        return stack
    }()
    
    lazy var collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
        return collectionView
    }()
    
    let mapButton = {
        var button = UIButton()
            .image(systemName: "map")
        
        return button
    }()
    
    let bulletListButton = {
        var button = UIButton()
            .image(systemName: "list.bullet")
        
        return button
    }()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.addSubview(background)
        background.addSubview(collectionView)
        background.addSubview(mapButton)
        background.addSubview(bulletListButton)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        background.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self)
                .offset(100)
            $0.horizontalEdges.equalTo(background.snp.horizontalEdges)
        }
        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.equalTo(background.snp.leading)
            $0.size.equalTo(50)
        }
        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.equalTo(background.snp.leading)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
        
        bulletListButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.trailing.equalTo(background.snp.trailing)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        background.backgroundColor = .black
    }
}
