//
//  MainView.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

final class MainView: BaseView {
    let background = {
        let image = UIImageView()
        return image
    }()
    
    let cityName = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Jeju City"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    let currentDegrees = {
        let label = UILabel()
        label.textColor = .white
        label.text = "5.9" + "º"
        label.font = .systemFont(ofSize: 40, weight: .medium)
        return label
    }()
    
    let weatherStatus = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Broken Clouds"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    let endPointDegrees = {
        let label = UILabel()
        label.textColor = .white
        label.text = "최고: \(7.0) | 최저 \(-4.2)"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    let collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        return collectionView
    }()
    
    let mapButton = {
        var button = UIButton()
            .image(systemName: "map")
        
        return button
    }
    
    let bulletListButton = {
        var button = UIButton()
            .image(systemName: "list.bullet")
        
        return button
    }
}
