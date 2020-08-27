//
//  Vehicle.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RealmSwift

class Vehicle: Object, Codable {
    
    @objc dynamic var address: String
    var coordinates: List<Double>
    @objc dynamic var engineType: String
    @objc dynamic var exterior: String
    @objc dynamic var fuel: Int
    @objc dynamic var interior: String
    @objc dynamic var name: String
    @objc dynamic var vin: String
    
    override static func primaryKey() -> String? {
      return "vin"
    }
    
    override class func ignoredProperties() -> [String] {
        return ["coordinates"]
    }
    
}
