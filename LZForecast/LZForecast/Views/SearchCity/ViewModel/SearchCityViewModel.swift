//
//  SearchCityViewModel.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import Foundation

final class SearchCityViewModel {
    let cityList: [City] = FileManager.shared.fetchFileData(fileName: "CityList", type: [City].self) ?? []
    lazy var filteredCityList: Observable<[City]> = Observable(cityList)
    
    var inputSearchText = Observable("")
    
    init() {
        inputSearchText.bind { [weak self] value in
            self?.searchTextChanged(value)
        }
    }
    
    func searchTextChanged(_ text: String) {
        if text.isEmpty {
            filteredCityList.value = cityList
        } else {
            filteredCityList.value = cityList.filter {
                $0.name.localizedStandardContains(text)
            }
        }
    }
}
