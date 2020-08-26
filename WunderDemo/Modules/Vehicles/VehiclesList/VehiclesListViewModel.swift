//
//  VehiclesListViewModel.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxSwift
import RxCocoa

final class VehiclesListViewModel: DisposableProtocol {
    
    let pageTitle: String = "Vehicles List"
    var dataSource: BehaviorRelay<[Vehicle]> = BehaviorRelay<[Vehicle]>(value: [])
    
    var disposeBag: DisposeBag = DisposeBag()
    private let service: VehicleBaseService<VehicleResponse>
    
    init(service: VehicleBaseService<VehicleResponse>) {
        self.service = service
    }
    
    func fetchNetworkData() {
        service.getVehiclesList()
            .bind (onNext: { [unowned self] (response) in
                self.dataSource.accept(response.vehicles ?? [])
            })
            .disposed(by: disposeBag)
    }
    
}
