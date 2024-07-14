//
//  MainViewModel.swift
//  LZForecast
//
//  Created by user on 7/14/24.
//

import Foundation

final class MainViewModel {
    let cellTypes = MainViewCellType.allCases
    var inputWeatherCurrentResponse = Observable(WeatherCurrentResponse(coord: Coordinate(lat: 0, lon: 0), weather: [], main: Main(temp: 0, temp_min: 0, temp_max: 0), wind: Wind(speed: 0, deg: 0, gust: 0), name: ""))
    var inputWeatherForecastResponse = Observable(WeatherForecastResponse(cod: "", message: 0, cnt: 0, list: []))
    
    var outPutCityInfo = Observable(CityInfo(cityName: "", currentTemp: 0.0, forecastStatus: "", maxTemp: 0.0, minTemp: 0.0))
    var outputThreeHourForecast = Observable([ThreeHourForecast]())
    var outputFiveDayForecast = Observable([FiveDayForecast]())
    var outputMapCoordinate = Observable(Coordinate(lat: 0, lon: 0))
    
    init() {
        inputWeatherCurrentResponse.bind { [weak self] _ in
            self?.convertCityInfo()
        }
        
        inputWeatherForecastResponse.bind { [weak self] _ in
            print(#function)
            self?.convertForecast()
        }
    }
    
    
    func convertCityInfo() {
        let cityInfo = CityInfo(
            cityName: inputWeatherCurrentResponse.value.name,
            currentTemp: inputWeatherCurrentResponse.value.main.temp - 275,
            forecastStatus: inputWeatherCurrentResponse.value.weather.first?.description ?? "",
            maxTemp: inputWeatherCurrentResponse.value.main.temp_max,
            minTemp: inputWeatherCurrentResponse.value.main.temp_min
        )
        
        let coord = Coordinate(
            lat: inputWeatherCurrentResponse.value.coord.lat,
            lon: inputWeatherCurrentResponse.value.coord.lon
        )
        
        outPutCityInfo.value = cityInfo
        outputMapCoordinate.value = coord
    }
    
    func convertForecast() {
        var threeHourForecast = [ThreeHourForecast]()
        var fiveDayForecast = [FiveDayForecast]()
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd HH:mm:ss"
        
        for index in 0..<inputWeatherForecastResponse.value.cnt {
            if index < 8 {
                let data = inputWeatherForecastResponse.value.list[index]
                let formattedDate = formatter.date(from: data.dt_txt) ?? Date()
                let time = Calendar.current.component(.hour, from: formattedDate)
                let forecast = ThreeHourForecast(
                    time: time,
                    iconName: data.weather.first?.icon ?? "",
                    degree: Int(data.main?.temp ?? 0)
                )
                threeHourForecast.append(forecast)
            }
            
            if index % 8 == 0 {
                let data = inputWeatherForecastResponse.value.list[index]
                let date = formatter.date(from: data.dt_txt) ?? Date()
                let weekdayRawValue = Calendar.current.component(.weekday, from: date)
                let weekDay = WeekDay.init(rawValue: weekdayRawValue)?.inKor ?? "오늘"
                
                let forecast = FiveDayForecast(
                    weekDay: weekDay,
                    iconName: data.weather.first?.icon ?? "",
                    minDegree: Int(data.main?.temp_max ?? 0),
                    maxDegree: Int(data.main?.temp_min ?? 0)
                )
                fiveDayForecast.append(forecast)
            }
        }
        outputThreeHourForecast.value = threeHourForecast
        outputFiveDayForecast.value = fiveDayForecast
    }
}

enum WeekDay: Int {
    case mon = 1
    case tue
    case wed
    case thr
    case fri
    case sat
    case sun
    
    var inKor: String {
        switch self {
        case .mon:
            return "월"
        case .tue:
            return "화"
        case .wed:
            return "수"
        case .thr:
            return "목"
        case .fri:
            return "금"
        case .sat:
            return "토"
        case .sun:
            return "일"
        }
    }
}
