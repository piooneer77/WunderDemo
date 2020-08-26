//
//  BindableProtocol.swift
//  WunderDemo
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit

protocol BindableProtocol {
    associatedtype ViewModelType
    var viewModel: ViewModelType? { get set }
    func bindViewModel()
}

extension BindableProtocol {
    mutating func bind(viewModel: Self.ViewModelType?) {
        self.viewModel = viewModel
//        bindViewModel()
    }
}
