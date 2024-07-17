//
//  URLBuilder.swift
//  LZForecast
//
//  Created by user on 7/14/24.
//
import Alamofire

enum URLBuilder {
    case current(RequestDataType)
    case forecast(RequestDataType)
    
    var baseUrl: String {
        return "https://api.openweathermap.org/data/2.5/"
    }
    
    var path: String {
        switch self {
        case .current(_):
            return "weather"
        case .forecast(_):
            return "forecast"
        }
    }
    
    var url: String {
        return baseUrl + path
    }
    
    var parameters: Parameters {
        switch self {
        case .current(let value), .forecast(let value):
            switch value {
            case .coordinate(let lat, let lon):
                let parameter: Parameters = [
                    "lat" : lat,
                    "lon" : lon,
                    "appid" : APIKey.appId
                ]
                return  parameter
            case .id(let id):
                let parameter: Parameters = [
                    "id" : id,
                    "appid" : APIKey.appId
                ]
                return parameter
            }
        }
    }
}
