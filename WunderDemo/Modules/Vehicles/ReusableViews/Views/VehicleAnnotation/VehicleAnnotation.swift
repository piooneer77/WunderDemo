//
//  VehicleAnnotation.swift
//  WunderDemo
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import MapKit

final class VehicleAnnotation: MKPointAnnotation {
    
    private var vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
        super.init()
        setupAnnotation()
    }
    
    private func setupAnnotation() {
        title = vehicle.name
        subtitle = vehicle.address
        guard let lon = vehicle.coordinates.first else { return }
        coordinate = CLLocationCoordinate2D(latitude: vehicle.coordinates[1], longitude: lon)
    }
    
}
