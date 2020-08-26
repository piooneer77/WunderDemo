//
//  VehicleBaseService.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxSwift
import RxCocoa

class VehicleBaseService<T: Codable>: GenericService<T>,  VehicleServiceProtocol {
    
    typealias Response = T
    
    // TODO: override in every child class
    func getVehiclesList() -> Observable<T> {
        return Observable.create { (observer) -> Disposable in
            Disposables.create()
        }
    }
    
}
