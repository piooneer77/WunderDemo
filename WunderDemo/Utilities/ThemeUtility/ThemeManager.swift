//
//  ThemeManager.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//


import UIKit

class ThemeManager {
    
    static var sharedInstance: ThemeManager = ThemeManager()
    
    func getThemeOf(type: ThemableObjectType, themeStyleKey: String, locale: String?) -> ThemeStyle? {
        return themeStyleFor(themableObjectType: type, withKey: themeStyleKey, locale: locale)
    }
    
    private func themeStyleFor(themableObjectType: ThemableObjectType, withKey: String, locale: String?) -> ThemeStyle? {
        
        var themableObjectTypeKey: String = ""
        
        switch themableObjectType {
        case .themableObjectOfTypeView:
            themableObjectTypeKey = ThemeMap_view_theme
        case .themableObjectOfTypeLabel:
            themableObjectTypeKey = ThemeMap_label_theme
        default:
            print("Error Creating themableObjectTypeKey")
            break
        }
        
        guard let themePropertyListPath = Bundle.main.path(forResource: "ThemePropertyList", ofType: "plist") else {
            print("Error Creating Theme List Path")
            return nil
        }
        guard let dictionary = NSDictionary(contentsOfFile: themePropertyListPath) as? [String: Any] else {
            print("Error Creating PLIST Root Dictionaries with path \(themePropertyListPath)")
            return nil
        }
        guard let themeDictionariesList = dictionary[themableObjectTypeKey] as? [String: Any] else {
            print("Error Creating Specific Themable OBject Dictionaries with Key \(themableObjectTypeKey)")
            return nil
        }
        guard let objectThemeDictionary = themeDictionariesList[withKey] as? [String: Any] else {
            print("Error Creating Theme Dictionary with Key \(withKey)")
            return nil
        }
        
        return ThemeStyle(withDictionary: objectThemeDictionary, locale: locale)
        
    }
    
}
