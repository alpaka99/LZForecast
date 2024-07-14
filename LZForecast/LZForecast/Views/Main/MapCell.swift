//
//  MapCell.swift
//  LZForecast
//
//  Created by user on 7/13/24.
//
import MapKit
import UIKit

import SnapKit

final class MapCell: BaseTableViewCell {
    let title = {
        let label = UILabel()
        label.text = "위치"
        return label
    }()
    let mapView = {
        let mapView = MKMapView()
        let initRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: ConstCoordinate.baseLat,
                longitude: ConstCoordinate.baseLon
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 100,
                longitudeDelta: 100
            ))
        mapView.region = initRegion
        return mapView
    }()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        contentView.addSubview(title)
        contentView.addSubview(mapView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        title.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(contentView)
        }
        mapView.snp.makeConstraints {
            $0.width.equalTo(contentView)
                .multipliedBy(0.6)
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.height.equalTo(mapView.snp.width)
            $0.top.equalTo(title.snp.bottom)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        mapView.backgroundColor = .systemBlue
        mapView.layer.cornerRadius = 8
    }
}
