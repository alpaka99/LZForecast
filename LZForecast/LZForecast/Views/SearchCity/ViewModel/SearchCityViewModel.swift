//
//  SearchCityViewModel.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import Foundation

final class SearchCityViewModel {
    private var cityList: [City] = []
    lazy var filteredCityList: Observable<[City]> = Observable(cityList)
    
    var inputSearchText = Observable("")
    
    init() {
        inputSearchText.bind { [weak self] value in
            self?.searchTextChanged(value)
        }
        
        let result = FileManager.shared.fetchFileData(fileName: "CityList", type: [City].self)
        
        switch result {
        case .success(let value):
            self.cityList = value
        case .failure(let error):
            print(error.localizedDescription)
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
