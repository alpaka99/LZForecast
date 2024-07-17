//
//  AlertViewModel.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import Foundation

final class AlertViewModel {
    init() {
        CustomReferenceCounter.shared.increment(name: String(describing: self))
    }
    
    var inputAlertTriggered: Observable<Void?> = Observable(())
    var inputCancelButtonTapped: Observable<Void?> = Observable(())
    var inputDeleteButtonTapped: Observable<Void?> = Observable(())
    var inputSearchButtonTapped: Observable<Void?> = Observable(())
    
    var inputSelectedCoordinate: Observable<Coordinate> = Observable(Coordinate(lat: 0, lon: 0))
    
    deinit {
        CustomReferenceCounter.shared.decrement(name: String(describing: self))
    }
}
