//
//  WeatherCurrentResponse.swift
//  LZForecast
//
//  Created by user on 7/14/24.
//

struct WeatherCurrentResponse: Codable {
    let coord: Coordinate
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct Coordinate: Codable {
    let lat: Double
    let lon: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Codable {
    let speed: Double?
    let deg: Double?
    let gust: Double?
}
