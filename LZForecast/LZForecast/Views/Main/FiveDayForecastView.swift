//
//  FiveDayForecastCell.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class FiveDayForecastView: BaseView {
    let tableView = UITableView()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.addSubview(tableView)
        tableView.backgroundColor = .green
    }
    
    override func configureLayout() {
        super.configureLayout()
        tableView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(self)
            $0.height.equalTo(200)
        }
    }
    
    override func configureUI() {
        super.configureUI()
    }
}
