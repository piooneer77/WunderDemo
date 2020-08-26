//
//  DisposableProtocol.swift
//  WunderDemo
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxSwift

protocol DisposableProtocol {
    var disposeBag: DisposeBag { get }
}
