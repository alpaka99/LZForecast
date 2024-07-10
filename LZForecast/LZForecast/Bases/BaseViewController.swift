//
//  BaseViewController.swift
//  LZForecast
//
//  Created by user on 7/10/24.
//

import UIKit

class BaseViewController<T: BaseView>: UIViewController {
    internal var baseView: T
    
    override func loadView() {
        self.view = baseView
        baseView.backgroundColor = .systemOrange
    }
    
    init(baseView: T) {
        self.baseView = baseView
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationItem()
        configureDelegate()
        bindData()
    }
    
    internal func configureNavigationItem() { }
    
    internal func configureDelegate() { }
    
    internal func bindData() { }
}
