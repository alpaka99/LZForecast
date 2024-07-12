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
        
        baseView.mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        baseView.bulletListButton.addTarget(self, action: #selector(bulletListButtonTapped), for: .touchUpInside)
        
        baseView.threeHourForecastView.collectionView.delegate = self
        baseView.threeHourForecastView.collectionView.dataSource = self
        baseView.threeHourForecastView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
        
        baseView.fiveDayForecastView.tableView.delegate = self
        baseView.fiveDayForecastView.tableView.dataSource = self
        baseView.fiveDayForecastView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        
        baseView.scrollView.backgroundColor = .red
        baseView.stackView.backgroundColor = .orange
        baseView.threeHourForecastView.collectionView.backgroundColor = .blue
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .orange
        return cell
    }
}
