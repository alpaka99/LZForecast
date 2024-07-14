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
        
        baseView.additionalInfo.collectionView.delegate = self
        baseView.additionalInfo.collectionView.dataSource = self
        baseView.additionalInfo.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
        baseView.additionalInfo.collectionView.register(AdditionalInfoCollectionViewCell.self, forCellWithReuseIdentifier: AdditionalInfoCollectionViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchWeatherData()
    }
    
    override func bindData() {
        super.bindData()
        
        viewModel.inputSearchButtonTapped.bind { [weak self] _ in
            let vc = SearchCityViewController(baseView: SearchCityView())
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        viewModel.outPutCityInfo.bind { [weak self] value in
            self?.baseView.cityInfoView.configureData(value)
        }
        
        viewModel.outputThreeHourForecast.bind { [weak self] value in
            self?.baseView.threeHourForecastView.collectionView.reloadData()
        }
        
        viewModel.outputFiveDayForecast.bind { [weak self] value in
            self?.baseView.fiveDayForecastView.tableView.reloadData()
        }
        
        viewModel.outputMapCoordinate.bind { [weak self] value in
            self?.baseView.mapCellView.configureData(value)
        }
    }
    
    @objc
    func mapButtonTapped() {
        
    }
    
    @objc
    
    func bulletListButtonTapped() {
        viewModel.inputSearchButtonTapped.value = ()
    }
    
    override func configureNavigationItem() {
        super.configureNavigationItem()
    }
    
    func fetchWeatherData() {
        WeatherAPIManager.shared.requestWeather(type: .current(.id(1835847)), responseType: WeatherCurrentResponse.self) {[weak self] response in
            self?.viewModel.inputWeatherCurrentResponse.value = response
        }
        
        WeatherAPIManager.shared.requestWeather(type: .forecast(.id(1835847)), responseType: WeatherForecastResponse.self) { [weak self] response in
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
        if collectionView == baseView.threeHourForecastView.collectionView {
            return viewModel.outputThreeHourForecast.value.count
        } else if collectionView == baseView.additionalInfo.collectionView {
            return 4
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == baseView.threeHourForecastView.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCollectionViewCell.identifier, for: indexPath) as? ThreeHourCollectionViewCell else {
                return UICollectionViewCell()
            }
            let data = viewModel.outputThreeHourForecast.value[indexPath.row]
            cell.configureData(data)
            
            return cell
        } else if collectionView == baseView.additionalInfo.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdditionalInfoCollectionViewCell.identifier, for: indexPath) as? AdditionalInfoCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath)
            return cell
        }
    }
}


enum MainViewCellType: CaseIterable {
    case cityInfo
    case threeHourForecast
    case fiveHourForecast
    case map
    case additinalInfo
}
