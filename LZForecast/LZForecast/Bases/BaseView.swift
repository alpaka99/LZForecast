//
//  BaseView.swift
//  LZForecast
//
//  Created by user on 7/10/24.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
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
    
    internal func configureUI() { }
    
    deinit {
        CustomReferenceCounter.shared.decrement(name: objectName)
    }
}
