//
//  SearchCityViewModel.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import Foundation

final class SearchCityViewModel {
    let cityList: [City] = FileManager.shared.fetchFileData(fileName: "CityList", type: [City].self) ?? []
}
