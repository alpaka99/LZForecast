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
    
    internal func requestWeather<T: Decodable>(type: URLBuilder, responseType: T.Type, completionHandler: @escaping (Result<T, AFError>)->Void) {
        let url = type.url
        let parameters = type.parameters
        
        AF.request(
            url,
            parameters: parameters)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
