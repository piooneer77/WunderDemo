//
//  AppCoordinator.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit

final class AppCoordinator: AppCoordinatorProtocol {
    
    var childrenControllers: [UIViewController]?
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let service = VehicleNetworkService()
        let controller = VehiclesListController(viewModel: VehiclesListViewModel(service: service))
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    
}
