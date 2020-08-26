//
//  VehicleCellViewModel.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxCocoa

final class VehicleCellViewModel {
    
    private let vehicle: Vehicle
    var name: Driver<String>
    var fuel: Driver<String>
    var address: Driver<String>
    var engineType: Driver<String>
    var interior: Driver<String>
    var exterior: Driver<String>
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
        name = .just(vehicle.name)
        fuel = .just("Fuel level: \(vehicle.fuel)")
        address = .just("Address: \(vehicle.fuel)")
        engineType = .just("Engine: \(vehicle.engineType)")
        exterior = .just("Exterior Condition: \(vehicle.exterior)")
        interior = .just("Interior Condition: \(vehicle.interior)")
    }
    
}
