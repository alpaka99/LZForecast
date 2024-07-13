//
//  MainViewController.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class MainViewController: BaseViewController<MainView> {
    override func configureDelegate() {
        super.configureDelegate()
        
        baseView.mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        baseView.bulletListButton.addTarget(self, action: #selector(bulletListButtonTapped), for: .touchUpInside)
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThreeHourForecastCell.identifier, for: indexPath) as? ThreeHourForecastCell else { return UITableViewCell() }
            cell.backgroundColor = .orange
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(#function)
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .orange
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
