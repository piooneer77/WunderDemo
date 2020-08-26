//
//  VehiclesMapCoordinator.swift
//  WunderDemo
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit

class VehiclesMapCoordinator: AppCoordinatorProtocol {
    
    var childrenControllers: [UIViewController]?
    private let navigationController: UINavigationController?
    private var vehicles: [Vehicle]?
    
    init(vehicles: [Vehicle]?, navigationController: UINavigationController?) {
        self.vehicles = vehicles
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = VehiclesMapController(viewModel: VehiclesMapViewModel(vehicles: vehicles ?? []))
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
