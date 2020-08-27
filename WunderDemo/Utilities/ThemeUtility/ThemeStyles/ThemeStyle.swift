//
//  ThemeStyle.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit

class ThemeStyle: Codable {
    
    var fontColor: String?
    var disabledFontColor: String?
    var tintColor: String?
    var fontSize: CGFloat?
    var backgroundColor: String?
    var backgroundGradient: GradientStyle?
    var shadow: ShadowStyle?
    var textAlignment: ObjectTextAlignment?
    var boldFont: Bool?
    var themeSpecifiedBoldFont: Bool?
    var fontFamily: String?
    var isCircle: Bool?
    var isUnderlined: Bool?
    var shouldBeFlipped: Bool?
    var borderStyle: BorderStyle?
    var margins: String?
    var selectionColor: String?
    var alpha: CGFloat?
    var textScaling: TextScaling?
    
    init(withDictionary: [String: Any], locale: String?) {
        
        if let value = withDictionary[CodingKeys.fontColor.rawValue] as? String {
            self.fontColor = value
        }
        if let value = withDictionary[CodingKeys.disabledFontColor.rawValue] as? String {
            self.disabledFontColor = value
        }
        if let value = withDictionary[CodingKeys.tintColor.rawValue] as? String {
            self.tintColor = value
        }
        if let value = withDictionary[CodingKeys.fontSize.rawValue] as? [String: String] {
            if UIScreen.main.scale == 3 {
                guard let size = value["3x"] else { return }
                self.fontSize = CGFloat(truncating: NumberFormatter().number(from: size)!)
            } else {
                guard let size = value["2x"] else { return }
                self.fontSize = CGFloat(truncating: NumberFormatter().number(from: size)!)
            }
        }
        if let value = withDictionary[CodingKeys.backgroundColor.rawValue] as? String {
            self.backgroundColor = value
        }
        if let value = withDictionary[CodingKeys.backgroundGradient.rawValue] as? [String: AnyObject] {
            self.backgroundGradient = GradientStyle(withDictionary: value)
        }
        if let value = withDictionary[CodingKeys.shadow.rawValue] as? [String: AnyObject] {
            self.shadow = ShadowStyle(withDictionary: value)
        }
        if let value = withDictionary[CodingKeys.textAlignment.rawValue] as? [String: Int] {
            var deviceLocale: String
            if let injectedLocale = locale {
                deviceLocale = injectedLocale
            } else {
                deviceLocale = Locale.current.languageCode!
            }
            let localeNumber = value[deviceLocale]
            switch localeNumber {
            case 0:
                self.textAlignment = ObjectTextAlignment.TextAlignmentLeft
            case 1:
                self.textAlignment = ObjectTextAlignment.TextAlignmentCenter
            default:
                self.textAlignment = ObjectTextAlignment.TextAlignmentRight
            }
        }
        if let value = withDictionary[CodingKeys.boldFont.rawValue] as? Bool {
            self.boldFont = value
        }
        if let value = withDictionary[CodingKeys.fontFamily.rawValue] as? String {
            self.fontFamily = value
        }
        if let value = withDictionary[CodingKeys.isCircle.rawValue] as? Bool {
            self.isCircle = value
        }
        if let value = withDictionary[CodingKeys.isUnderlined.rawValue] as? Bool {
            self.isUnderlined = value
        }
        if let value = withDictionary[CodingKeys.shouldBeFlipped.rawValue] as? Bool {
            self.shouldBeFlipped = value
        }
        if let value = withDictionary[CodingKeys.borderStyle.rawValue] as? [String: AnyObject] {
            self.borderStyle = BorderStyle(withDictionary: value)
        }
        if let value = withDictionary[CodingKeys.margins.rawValue] as? String {
            self.margins = value
        }
        if let value = withDictionary[CodingKeys.selectionColor.rawValue] as? String {
            self.selectionColor = value
        }
        if let value = withDictionary[CodingKeys.alpha.rawValue] as? CGFloat {
            self.alpha = value
        }
        if let value = withDictionary[CodingKeys.textScaling.rawValue] as? [String: AnyObject] {
            self.textScaling = TextScaling(withDictionary: value)
        }
        
    }
    
    private enum CodingKeys: String, CodingKey {
        case fontColor = "text_color"
        case disabledFontColor = "disabled_text_color"
        case tintColor = "tint_color"
        case fontSize = "font_size"
        case backgroundColor = "background_color"
        case backgroundGradient = "background_gradient"
        case shadow = "shadow"
        case textAlignment = "text_alignment"
        case boldFont = "bold"
        case fontFamily = "font_family"
        case isCircle = "isCircle"
        case isUnderlined = "underlined"
        case shouldBeFlipped = "flipped"
        case borderStyle = "border"
        case margins = "margins"
        case selectionColor = "selection_color"
        case alpha = "alpha"
        case textScaling = "textScaling"
    }
    
}
