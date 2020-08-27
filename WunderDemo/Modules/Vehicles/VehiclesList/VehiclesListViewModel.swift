//
//  VehiclesListViewModel.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxSwift
import RxCocoa
import RealmSwift

final class VehiclesListViewModel: DisposableProtocol {
    
    // TODO: I would create a protocol that receives a generic type and do all crud operations
    // TODO: add check for the current date depending on business rules how long is the gab between requests
    
    // MARK: - Properties
    let pageTitle: String = "Vehicles List"
    var dataSource: BehaviorRelay<[Vehicle]> = BehaviorRelay<[Vehicle]>(value: [])
    
    var disposeBag: DisposeBag = DisposeBag()
    private let service: VehicleServiceProtocol
    
    // MARK: - initializers
    init(service: VehicleServiceProtocol) {
        self.service = service
    }
    
    // MARK: - public methods
    func fetchNetworkData() {
        service.getVehiclesList { [unowned self] (response, error) in
            if let list = response?.vehicles, list.count > 0 {
                self.dataSource.accept(list)
            }
        }
    }
    
    private func saveVehicles() {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.add(dataSource.value, update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
