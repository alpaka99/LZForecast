//
//  FiveDayForecastCell.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class FiveDayForecastView: BaseView {
    let title = {
        let label = UILabel()
        label.text = "5일 알림"
        return label
    }()
    
    let tableView = UITableView()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.addSubview(title)
        self.addSubview(tableView)
        tableView.backgroundColor = .green
    }
    
    override func configureLayout() {
        super.configureLayout()
        title.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom)
            $0.horizontalEdges.equalTo(self)
            $0.bottom.equalTo(self)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
}
