//
//  BaseCollectionViewCell.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//


import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configureHierarchy() { }
    
    internal func configureLayout() { }
    
    internal func configureUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}

