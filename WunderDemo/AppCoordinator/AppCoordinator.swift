//
//  AppCoordinator.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit

protocol AppCoordinatorProtocol {
    var childrenControllers: [UIViewController]? { get }
    func start()
}

class AppCoordinator: AppCoordinatorProtocol {
    
    var childrenControllers: [UIViewController]?
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let service = VehicleNetworkService<VehicleResponse>()
        let controller = VehiclesListController(viewModel: VehiclesListViewModel(service: service))
        let navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    
}
