//
//  SearchCityViewController.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import UIKit

final class SearchCityViewController: BaseViewController<SearchCityView> {
    
    let viewModel = SearchCityViewModel()
    var searchClosure: ((Int)->Void)?
    
    override func configureDelegate() {
        super.configureDelegate()
        
        baseView.searchBar.delegate = self
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        baseView.tableView.register(SearchCityCell.self, forCellReuseIdentifier: SearchCityCell.identifier)
        
    }
    
    
    override func bindData() {
        viewModel.filteredCityList.bind { [weak self] _ in
            self?.baseView.tableView.reloadData()
        }
    }
}

extension SearchCityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.inputSearchText.value = searchText
    }
}

extension SearchCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredCityList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCityCell.identifier, for: indexPath) as? SearchCityCell else {
            return UITableViewCell()
        }
        let data = viewModel.filteredCityList.value[indexPath.row]
        cell.configureData(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.filteredCityList.value[indexPath.row]
        searchClosure?(data.id)
        navigationController?.popViewController(animated: true)
    }
}
