//
//  MainViewModel.swift
//  LZForecast
//
//  Created by user on 7/14/24.
//

import Foundation

final class MainViewModel {
    let cellTypes = MainViewCellType.allCases
    
    init() {
        inputWeatherCurrentResponse.bind { [weak self] _ in
            self?.currentResponseToCityInfo()
        }
    }
    
    var inputWeatherCurrentResponse = Observable(WeatherCurrentResponse(coord: Coordinate(lat: 0, lon: 0), weather: [], main: Main(temp: 0, temp_min: 0, temp_max: 0), wind: Wind(speed: 0, deg: 0, gust: 0), name: ""))
    var outPutCityInfo = Observable(CityInfo(cityName: "", currentTemp: 0.0, forecastStatus: "", maxTemp: 0.0, minTemp: 0.0))
    
    func currentResponseToCityInfo() {
        let cityInfo = CityInfo(
            cityName: inputWeatherCurrentResponse.value.name,
            currentTemp: inputWeatherCurrentResponse.value.main.temp - 275,
            forecastStatus: inputWeatherCurrentResponse.value.weather.first?.description ?? "",
            maxTemp: inputWeatherCurrentResponse.value.main.temp_max,
            minTemp: inputWeatherCurrentResponse.value.main.temp_min
        )
        
        outPutCityInfo.value = cityInfo
    }
}
