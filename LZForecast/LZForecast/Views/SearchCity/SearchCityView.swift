//
//  SearchCityView.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import UIKit

import Alamofire

final class SearchCityView: BaseView {
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.addSubview(searchBar)
        self.addSubview(tableView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        searchBar.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        self.backgroundColor = .black
        searchBar.barStyle = .black
        tableView.backgroundColor = .black
    }
}
