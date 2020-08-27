//
//  BorderStyle.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

class BorderStyle: Codable {
    
    var borderColor: String?
    var borderWidth: Float?
    var cornerRadius: Float?
    var borderOpacity: Float?
    
    init(withDictionary: [String: AnyObject]) {
        
        if let value = withDictionary[CodingKeys.borderColor.rawValue] as? String {
            self.borderColor = value
        }
        if let value = withDictionary[CodingKeys.borderWidth.rawValue] as? Float {
            self.borderWidth = value
        }
        if let value = withDictionary[CodingKeys.cornerRadius.rawValue] as? Float {
            self.cornerRadius = value
        }
        if let value = withDictionary[CodingKeys.borderOpacity.rawValue] as? Float {
            self.cornerRadius = value
        }
        
    }
    
    private enum CodingKeys: String, CodingKey {
        case borderColor = "border_color"
        case borderWidth = "border_width"
        case cornerRadius = "corner_radius"
        case borderOpacity = "border_opacity"

    }
    
}
