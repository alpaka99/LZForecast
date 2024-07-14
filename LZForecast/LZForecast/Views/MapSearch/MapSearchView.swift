//
//  MapSearchView.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//
import MapKit
import UIKit

import SnapKit

final class MapSearchView: BaseView {
    let mapView = {
        let map = MKMapView()
        let initRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: ConstCoordinate.baseLat, longitude: ConstCoordinate.baseLon), latitudinalMeters: 400, longitudinalMeters: 400)
        map.region = initRegion
        return map
    }()
    
    let annotationButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "이 위치에 핀 놓기"
        config.background.backgroundColor = .systemBlue
        config.baseForegroundColor = .white
        button.configuration = config
        return button
    }()
    
    let centerCircle = {
        let image = UIImageView()
        image.image = UIImage(systemName: "scope")
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemBlue.withAlphaComponent(0.5)
        return image
    }()
    
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.addSubview(mapView)
        self.addSubview(annotationButton)
        self.addSubview(centerCircle)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        mapView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        annotationButton.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom)
                .offset(16)
            
            $0.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
                .inset(16)
        }
        
        centerCircle.snp.makeConstraints {
            $0.center.equalTo(mapView.snp.center)
            $0.size.equalTo(20)
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        annotationButton.layer.cornerRadius = annotationButton.frame.height / 2
        centerCircle.layer.cornerRadius = centerCircle.frame.height / 2
        
    }
}
