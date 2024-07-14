//
//  WeatherAPIManager.swift
//  LZForecast
//
//  Created by user on 7/14/24.
//

import Foundation

import Alamofire

final class WeatherAPIManager {
    static let shared = WeatherAPIManager()
    
    private init() { }
    
    internal func requestWeather(type: URLBuilder) {
        let url = type.url
        let parameters = type.parameters
        
        
        AF.request(
            url,
            parameters: parameters)
        .responseDecodable(of: WeatherForecastResponse.self) { response in
            switch response.result {
            case .success(let value):
                dump(value)
            case .failure(let error):
                print("Decoding fail")
                print(error)
            }
        }
//        .responseString { result in
//            print(result)
//        }
    }
}
