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
    let alertViewModel = AlertViewModel()
    
    var closure: ((Coordinate)->Void)?

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
        
        alertViewModel.inputAlertTriggered.bind { [weak self] _ in
            let ac = UIAlertController(title: "이 위치에", message: "어떤 일을 해볼까요?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "취소", style: .cancel) { _  in
                self?.alertViewModel.inputCancelButtonTapped.value = ()
            }
            let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { _ in
                self?.alertViewModel.inputDeleteButtonTapped.value = ()
            }
            let searchAction = UIAlertAction(title: "검색", style: .default) { _ in
                self?.alertViewModel.inputSearchButtonTapped.value = ()
            }
            
            ac.addAction(cancelAction)
            ac.addAction(deleteAction)
            ac.addAction(searchAction)
            
            self?.present(ac, animated: true)
        }
        
        alertViewModel.inputCancelButtonTapped.bind { [weak self] _ in
            self?.dismiss(animated: true)
            let annotation = self?.baseView.mapView.selectedAnnotations.first
            self?.baseView.mapView.deselectAnnotation(annotation, animated: true)
        }
        
        alertViewModel.inputDeleteButtonTapped.bind { [weak self] _ in
            guard let vc = self else { return }
            let annotations = vc.baseView.mapView.selectedAnnotations
            vc.baseView.mapView.removeAnnotations(annotations)
        }
        
        alertViewModel.inputSearchButtonTapped.bind { [weak self] value in
            guard let vc = self else { return }
            let coordinate = Coordinate(lat: vc.baseView.mapView.centerCoordinate.latitude, lon: vc.baseView.mapView.centerCoordinate.longitude)
            
            self?.alertViewModel.inputSelectedCoordinate.value = coordinate
        }
        
        alertViewModel.inputSelectedCoordinate.bind { [weak self] value in
            self?.closure?(value)
            self?.navigationController?.popViewController(animated: true)
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
        alertViewModel.inputAlertTriggered.value = ()
    }
}
