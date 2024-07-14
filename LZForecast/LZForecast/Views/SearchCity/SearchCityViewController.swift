//
//  SearchCityViewController.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import UIKit

final class SearchCityViewController: BaseViewController<SearchCityView> {
    
    let viewModel = SearchCityViewModel()
    
    override func configureDelegate() {
        super.configureDelegate()
        
        baseView.searchBar.delegate = self
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        baseView.tableView.register(SearchCityCell.self, forCellReuseIdentifier: SearchCityCell.identifier)
        
        fetchCityListInfo()
    }
    
    func fetchCityListInfo() {
        
    }
}

extension SearchCityViewController: UISearchBarDelegate {
    
}

extension SearchCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCityCell.identifier, for: indexPath) as? SearchCityCell else {
            return UITableViewCell()
        }
        let data = viewModel.cityList[indexPath.row]
        cell.configureData(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
