//
//  VehicleServiceProtocol.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxSwift
import RxCocoa

protocol VehicleServiceProtocol {
    associatedtype Response
    func getVehiclesList() -> Observable<Response>
}
