//
//  BaseTableViewCell.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        CustomReferenceCounter.shared.increment(name: objectName)
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
    }
    
    deinit {
        CustomReferenceCounter.shared.decrement(name: objectName)
    }
}
