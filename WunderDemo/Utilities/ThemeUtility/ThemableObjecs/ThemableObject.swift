//
//  ThemableObject.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

protocol ThemableObject {
    var styleKey: String? { get set }
    var themeStyle: ThemeStyle! { get set }
}
