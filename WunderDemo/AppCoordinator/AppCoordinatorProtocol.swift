//
//  AppCoordinatorProtocol.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit

protocol AppCoordinatorProtocol {
    var childrenControllers: [UIViewController]? { get }
    func start()
}
