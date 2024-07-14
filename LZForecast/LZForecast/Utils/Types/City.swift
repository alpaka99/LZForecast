//
//  City.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

struct City: Codable {
    let id: Int
    let name: String
    let state: String
    let country: String
    let coord: Coordinate
}
