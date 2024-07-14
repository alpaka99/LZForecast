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
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        baseView.tableView.register(CityInfoCell.self, forCellReuseIdentifier: CityInfoCell.identifier)
        baseView.tableView.register(ThreeHourForecastCell.self, forCellReuseIdentifier: ThreeHourForecastCell.identifier)
        baseView.tableView.register(FiveDayForecastCell.self, forCellReuseIdentifier: FiveDayForecastCell.identifier)
        baseView.tableView.register(MapCell.self, forCellReuseIdentifier: MapCell.identifier)
        baseView.tableView.register(AdditionalInfoCell.self, forCellReuseIdentifier: AdditionalInfoCell.identifier)
    }
    
    override func bindData() {
        super.bindData()
        
        viewModel.outPutCityInfo.bind { [weak self] _ in
            self?.baseView.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
        
        viewModel.outputThreeHourForecast.bind { [weak self] value in
            print(value.count)
            self?.baseView.tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
        }
        
        viewModel.outputFiveDayForecast.bind { [weak self] value in
            print(value.count)
            self?.baseView.tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .automatic)
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return 1
        } else {
            return viewModel.outputFiveDayForecast.value.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cellType = viewModel.cellTypes[indexPath.section]
            switch cellType {
            case .cityInfo:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoCell.identifier, for: indexPath) as? CityInfoCell else { return UITableViewCell() }
                cell.configureData(viewModel.outPutCityInfo.value)
                return cell
            case .threeHourForecast:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ThreeHourForecastCell.identifier, for: indexPath) as? ThreeHourForecastCell else { return UITableViewCell() }
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                cell.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
                cell.collectionView.register(ThreeHourCollectionViewCell.self, forCellWithReuseIdentifier: ThreeHourCollectionViewCell.identifier)
                cell.collectionView.tag = indexPath.section
                return cell
            case .fiveHourForecast:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: FiveDayForecastCell.identifier, for: indexPath) as? FiveDayForecastCell else { return UITableViewCell() }
                cell.tableView.delegate = self
                cell.tableView.dataSource = self
                cell.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
                cell.tableView.tag = indexPath.section
                return cell
            case .map:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: MapCell.identifier, for: indexPath) as? MapCell else { return UITableViewCell() }
                return cell
            case .additinalInfo:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: AdditionalInfoCell.identifier, for: indexPath) as? AdditionalInfoCell else { return UITableViewCell() }
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                cell.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
                cell.collectionView.register(AdditionalInfoCollectionViewCell.self, forCellWithReuseIdentifier: AdditionalInfoCollectionViewCell.identifier)
                cell.collectionView.tag = indexPath.section
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath) as UITableViewCell
            cell.textLabel?.text = "plz"
            cell.backgroundColor = .clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == baseView.tableView {
            return 300
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
        if collectionView.tag == 1 {
            return viewModel.outputThreeHourForecast.value.count
        } else if collectionView.tag == 4 {
            return 4
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCollectionViewCell.identifier, for: indexPath) as? ThreeHourCollectionViewCell else { return UICollectionViewCell() }
            let data = viewModel.outputThreeHourForecast.value[indexPath.row]
            cell.configureData(data)
            return cell
        } else if collectionView.tag == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdditionalInfoCollectionViewCell.identifier, for: indexPath)
            cell.backgroundColor = .orange
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath)
            cell.backgroundColor = .orange
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, indexPath)
    }
}


enum MainViewCellType: CaseIterable {
    case cityInfo
    case threeHourForecast
    case fiveHourForecast
    case map
    case additinalInfo
}
