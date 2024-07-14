//
//  MapSearchViewController.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//
import MapKit
import UIKit

final class MapSearchViewController: BaseViewController<MapSearchView> {
    
    let viewModel = MapSearchViewModel()

    override func configureDelegate() {
        super.configureDelegate()
        
        
        baseView.mapView.delegate = self
        
        baseView.annotationButton.addTarget(self, action: #selector(annotationButtonTapped), for: .touchUpInside)
        
    }
    
    override func bindData() {
        super.bindData()
        
        viewModel.inputCoordinate.bind {[weak self] value in
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: value.lat, longitude: value.lon)
            self?.baseView.mapView.addAnnotation(annotation)
        }
    }
    
    @objc
    func annotationButtonTapped(_ sender: UIButton) {
        viewModel.inputCoordinate.value = Coordinate(
            lat: baseView.mapView.centerCoordinate.latitude,
            lon: baseView.mapView.centerCoordinate.longitude
        )
    }
}

extension MapSearchViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(#function)
    }
}
