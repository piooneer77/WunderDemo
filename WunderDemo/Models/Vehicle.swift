//
//  Vehicle.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

struct Vehicle: Codable {
    var address: String
    var coordinates: [Double]
    var engineType: EngineType
    var exterior: Interior
    var fuel: Int
    var interior: Interior
    var name, vin: String

//    init(address: String?, coordinates: [Double]?, engineType: EngineType?, exterior: Interior?, fuel: Int?, interior: Interior?, name: String?, vin: String?) {
//        self.address = address
//        self.coordinates = coordinates
//        self.engineType = engineType
//        self.exterior = exterior
//        self.fuel = fuel
//        self.interior = interior
//        self.name = name
//        self.vin = vin
//    }
}
