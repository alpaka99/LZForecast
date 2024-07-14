//
//  Weekday.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

enum WeekDay: Int {
    case mon = 1
    case tue
    case wed
    case thr
    case fri
    case sat
    case sun
    
    var inKor: String {
        switch self {
        case .mon:
            return "월"
        case .tue:
            return "화"
        case .wed:
            return "수"
        case .thr:
            return "목"
        case .fri:
            return "금"
        case .sat:
            return "토"
        case .sun:
            return "일"
        }
    }
}
