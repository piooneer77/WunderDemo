//
//  VehicleMockService.swift
//  WunderDemoTests
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxSwift
import RxCocoa

enum CustomError: Error {
    case parsingError
    case networkIssue
    case noCarsArroundYou
}

final class VehicleMockService: VehicleServiceProtocol {
    
    typealias Response = VehicleResponse
    
    var shouldHaveInternetConnection: Bool = true
    var shouldHaveParsingError: Bool = false
    var shouldHaveEmptyVehiclesList: Bool = false
    
    func getVehiclesList(completion: ((VehicleResponse?, Error?) -> Void)?) {
        if !shouldHaveInternetConnection {
            completion?(nil, CustomError.networkIssue)
        } else {
            if let filePath = Bundle.main.path(forResource: "VehiclesListMock", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
                    let response = try JSONDecoder().decode(VehicleResponse.self , from: data)
                    
                    if let list = response.vehicles, list.count > 0 {
                        completion?(response, nil)
                    } else {
                        completion?(nil, CustomError.noCarsArroundYou)
                    }
                } catch {
                    completion?(nil, CustomError.parsingError)
                }
            }
        }
    }
    
    func getVehiclesList() -> (VehicleResponse?, Error?)? {
        if !shouldHaveInternetConnection {
            return (nil, CustomError.networkIssue)
        } else {
            if let filePath = Bundle.main.path(forResource: "VehiclesListMock", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
                    let response = try JSONDecoder().decode(VehicleResponse.self , from: data)
                    
                    if let list = response.vehicles, list.count > 0 {
                        return (response, nil)
                    } else {
                        return (nil, CustomError.noCarsArroundYou)
                    }
                } catch {
                    return (nil, CustomError.parsingError)
                }
            }
        }
        return nil
    }
    
    func resetTestValueToDefaults() {
        shouldHaveInternetConnection = true
        shouldHaveParsingError = false
        shouldHaveEmptyVehiclesList = false
    }
    
}
