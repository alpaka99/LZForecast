//
//  MapSearchViewModel.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import Foundation

final class MapSearchViewModel {
    init() {
        CustomReferenceCounter.shared.increment(name:  String(describing: type(of: self)))
    }
    
    var inputCoordinate = Observable(Coordinate(lat: 0, lon: 0))
    var inputMapCenter = Observable(Coordinate(lat: ConstCoordinate.baseLat, lon: ConstCoordinate.baseLon))
    
    deinit {
        CustomReferenceCounter.shared.decrement(name:  String(describing: type(of: self)))
    }
}
