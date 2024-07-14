//
//  MainViewController.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

import SnapKit

final class MainViewController: BaseViewController<MainView> {
    
    let viewModel = MainViewModel()
    
    override func configureDelegate() {
        super.configureDelegate()
        
        baseView.mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        baseView.bulletListButton.addTarget(self, action: #selector(bulletListButtonTapped), for: .touchUpInside)
        
        baseView.threeHourForecastView.collectionView.delegate = self
        baseView.threeHourForecastView.collectionView.dataSource = self
        baseView.threeHourForecastView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
        baseView.threeHourForecastView.collectionView.register(ThreeHourCollectionViewCell.self, forCellWithReuseIdentifier: ThreeHourCollectionViewCell.identifier)
        
        baseView.fiveDayForecastView.tableView.delegate = self
        baseView.fiveDayForecastView.tableView.dataSource = self
        baseView.fiveDayForecastView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        baseView.fiveDayForecastView.tableView.register(FiveDayForecastTableViewCell.self, forCellReuseIdentifier: FiveDayForecastTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchWeatherData()
    }
    
    override func bindData() {
        super.bindData()
        
        viewModel.outPutCityInfo.bind { [weak self] value in
            self?.baseView.cityInfoView.configureData(value)
        }
        
        viewModel.outputThreeHourForecast.bind { [weak self] value in
            print(value.count)
            self?.baseView.threeHourForecastView.collectionView.reloadData()
        }
        
        viewModel.outputFiveDayForecast.bind { [weak self] value in
            print(value.count)
            self?.baseView.fiveDayForecastView.tableView.reloadData()
        }
    }
    
    @objc
    func mapButtonTapped() {
        fetchWeatherData()
    }
    
    @objc
    
    func bulletListButtonTapped() {
        print(#function)
    }
    
    override func configureNavigationItem() {
        super.configureNavigationItem()
    }
    
    func fetchWeatherData() {
        WeatherAPIManager.shared.requestWeather(type: .current(.coordinate(ConstCoordinate.baseLat, ConstCoordinate.baseLon)), responseType: WeatherCurrentResponse.self) {[weak self] response in
            self?.viewModel.inputWeatherCurrentResponse.value = response
        }
        
        WeatherAPIManager.shared.requestWeather(type: .forecast(.coordinate(ConstCoordinate.baseLat, ConstCoordinate.baseLon)), responseType: WeatherForecastResponse.self) { [weak self] response in
            self?.viewModel.inputWeatherForecastResponse.value = response
        }
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputFiveDayForecast.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FiveDayForecastTableViewCell.identifier, for: indexPath) as? FiveDayForecastTableViewCell else { return UITableViewCell() }
        let data = viewModel.outputFiveDayForecast.value[indexPath.row]
        cell.configureData(data)
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.outputThreeHourForecast.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCollectionViewCell.identifier, for: indexPath) as? ThreeHourCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = viewModel.outputThreeHourForecast.value[indexPath.row]
        cell.configureData(data)
        
        return cell
    }
}


enum MainViewCellType: CaseIterable {
    case cityInfo
    case threeHourForecast
    case fiveHourForecast
    case map
    case additinalInfo
}
