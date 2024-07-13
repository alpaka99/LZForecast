//
//  MainView.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class MainView: BaseView {
    let tableView = UITableView()
    
    let background = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        return image
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
        self.addSubview(tableView)
        self.addSubview(mapButton)
        self.addSubview(bulletListButton)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        background.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        tableView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self)
        }
        
        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.equalTo(tableView.snp.leading)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
        
        bulletListButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.trailing.equalTo(tableView.snp.trailing)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
    }
}
