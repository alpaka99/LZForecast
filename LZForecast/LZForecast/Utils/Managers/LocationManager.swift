//
//  LocationManager.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//
import CoreLocation
import Foundation

final class LocationManager: NSObject {
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    
    private override init() { }
}


extension LocationManager: CLLocationManagerDelegate {
    func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentAuthorization()
        } else {
            print("위치 정보 허용이 꺼져있음")
        }
    }
    
    func checkCurrentAuthorization() {
        var status = locationManager.authorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        
        
        switch status {
        case .notDetermined:
            print("이 권한에서만 문구를 띄울 수 있음")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            print("iOS 설정창으로 이동하는 alert 띄워주기")
        case .authorizedWhenInUse, .authorizedAlways:
            print("위치 권한 허용")
            locationManager.startUpdatingLocation()
        default:
            print("\(status) 상태")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
    }
    
    func getUserLocation() -> CLLocation? {
        locationManager.startUpdatingLocation()
        
        if let location = locationManager.location {
            return location
        }
        
        return nil
    }
}
