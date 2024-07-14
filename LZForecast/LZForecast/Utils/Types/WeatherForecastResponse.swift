//
//  WeatherForecastResponse.swift
//  LZForecast
//
//  Created by user on 7/14/24.
//

struct WeatherForecastResponse: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [Forecast]
}

struct Forecast: Codable {
    let main: Main?
    let weather: [Weather]
    let dt_txt: String
}
