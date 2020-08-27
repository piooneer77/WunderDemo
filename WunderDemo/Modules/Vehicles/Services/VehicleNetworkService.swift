//
//  VehicleNetworkService.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import Foundation

class VehicleNetworkService: GenericService<VehicleResponse>, VehicleServiceProtocol {
    
    func getVehiclesList(completion: ((VehicleResponse?, Error?) -> Void)?) {
        let urlString = "https://wunder-test-case.s3-eu-west-1.amazonaws.com/ios/locations.json"
        let url: URL = URL(string: urlString)!
        super.fireRequest(url: url) { (responseObject, error) in
            if let error = error {
                completion?(nil, error)
                return
            } else if let list = responseObject {
                completion?(list, nil)
            }
        }
    }
    
}
