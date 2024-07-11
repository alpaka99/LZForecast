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
    
    let tableView = UITableView()
    
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
        background.addSubview(tableView)
        background.addSubview(mapButton)
        background.addSubview(bulletListButton)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        background.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self)
                .offset(100)
            $0.horizontalEdges.equalTo(background.snp.horizontalEdges)
        }
        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.equalTo(background.snp.leading)
            $0.size.equalTo(50)
        }
        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.equalTo(background.snp.leading)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.size.equalTo(50)
        }
        
        bulletListButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
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
