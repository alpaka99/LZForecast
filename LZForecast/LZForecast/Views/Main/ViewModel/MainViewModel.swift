//
//  MainViewModel.swift
//  LZForecast
//
//  Created by user on 7/14/24.
//

import Foundation

final class MainViewModel {
    let cellTypes = MainViewCellType.allCases
    
    var cityInfo = Observable(CityInfo(cityName: "", currentTemp: 0.0, forecastStatus: "", maxTemp: 0.0, minTemp: 0.0))
}
