//
//  MainViewController.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class MainViewController: BaseViewController<MainView> {
    
    let cellTypes = MainViewCellType.allCases
    
    override func configureDelegate() {
        super.configureDelegate()
        
        baseView.mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        baseView.bulletListButton.addTarget(self, action: #selector(bulletListButtonTapped), for: .touchUpInside)
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        baseView.tableView.register(CityInfoView.self, forCellReuseIdentifier: CityInfoView.identifier)
        baseView.tableView.register(ThreeHourForecastCell.self, forCellReuseIdentifier: ThreeHourForecastCell.identifier)
        baseView.tableView.register(FiveDayForecastCell.self, forCellReuseIdentifier: FiveDayForecastCell.identifier)
    }
    
    @objc
    func mapButtonTapped() {
        print(#function)
    }
    
    @objc
    func bulletListButtonTapped() {
        print(#function)
    }
    
    override func configureNavigationItem() {
        super.configureNavigationItem()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == baseView.tableView {
            return 1
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == baseView.tableView {
            let cellType = cellTypes[indexPath.section]
            switch cellType {
            case .cityInfo:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoView.identifier, for: indexPath) as? CityInfoView else { return UITableViewCell() }
                return cell
            case .threeHourForecast:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ThreeHourForecastCell.identifier, for: indexPath) as? ThreeHourForecastCell else { return UITableViewCell() }
                cell.backgroundColor = .orange
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                cell.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
                
                return cell
            case .fiveHourForecast:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: FiveDayForecastCell.identifier, for: indexPath) as? FiveDayForecastCell else { return UITableViewCell() }
                
                cell.tableView.delegate = self
                cell.tableView.dataSource = self
                cell.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath) as UITableViewCell
            cell.textLabel?.text = "plz"
            cell.backgroundColor = .systemPink
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == baseView.tableView {
            return 200
        } else {
            return UITableView.automaticDimension
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .orange
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, indexPath)
    }
}


enum MainViewCellType: CaseIterable {
    case cityInfo
    case threeHourForecast
    case fiveHourForecast
}
