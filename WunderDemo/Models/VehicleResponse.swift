//
//  VehicleResponse.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

class VehicleResponse: Codable {
    var vehicles: [Vehicle]?

    init(vehicles: [Vehicle]?) {
        self.vehicles = vehicles
    }
    
    private enum CodingKeys: String, CodingKey {
        case vehicles = "placemarks"
    }
}
