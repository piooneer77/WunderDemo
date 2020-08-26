//
//  VehiclesMapViewModel.swift
//  WunderDemo
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxSwift
import RxCocoa

final class VehiclesMapViewModel: DisposableProtocol {
    
    // MARK: - Properties
    let pageTitle: String = "Vehicles Map"
    var shouldZoomOnUserLocation: Bool = true
    var dataSource: BehaviorRelay<[Vehicle]> = BehaviorRelay<[Vehicle]>(value: [])
    
    var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: initializzers
    init(vehicles: [Vehicle]) {
        dataSource.accept(vehicles)
        if vehicles.count < 2 {
            shouldZoomOnUserLocation = false
        }
    }
    
}
