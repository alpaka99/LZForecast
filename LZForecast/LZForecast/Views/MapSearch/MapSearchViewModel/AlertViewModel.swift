//
//  AlertViewModel.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import Foundation

final class AlertViewModel {
    var inputAlertTriggered: Observable<Void?> = Observable(())
    var inputCancelButtonTapped: Observable<Void?> = Observable(())
    var inputDeleteButtonTapped: Observable<Void?> = Observable(())
    var inputSearchButtonTapped: Observable<Void?> = Observable(())
    
    let alertTitle = "이 위치에서"
    let message = "어떤 일을 해볼까요?"
    let cancelTitle = "취소"
    let deleteTitle = "삭제"
    let searchTitle = "검색"
    
    var inputSelectedCoordinate: Observable<Coordinate> = Observable(Coordinate(lat: 0, lon: 0))
}
