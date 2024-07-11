//
//  MainViewController.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

final class MainViewController: BaseViewController<MainView> {
    override func configureDelegate() {
        super.configureDelegate()
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        baseView.tableView.register(CityInfoCell.self, forCellReuseIdentifier: CityInfoCell.identifier)
        baseView.tableView.register(ThreeHourForecastCell.self, forCellReuseIdentifier: ThreeHourForecastCell.identifier)
    }
    
    override func configureNavigationItem() {
        super.configureNavigationItem()
        
        baseView.tableView.backgroundColor = .clear
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoCell.identifier, for: indexPath) as? CityInfoCell else { return UITableViewCell() }
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThreeHourForecastCell.identifier, for: indexPath) as? ThreeHourForecastCell else { return UITableViewCell() }
            
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath) as UICollectionViewCell
        cell.backgroundColor = .systemOrange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
