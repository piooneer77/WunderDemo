//
//  VehicleServiceProtocol.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

protocol VehicleServiceProtocol {
    func getVehiclesList(completion: ((VehicleResponse?, Error?) -> Void)?)
}
