//
//  ShadowStyle.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

class ShadowStyle: Codable {
    
    var shadowColor: String?
    var shadowRadius: Float?
    var shadowOpacity: Double?
    var shadowxOffset: Float?
    var shadowyOffset: Float?
    
    init(withDictionary: [String: AnyObject]) {
        
        if let value = withDictionary[CodingKeys.shadowColor.rawValue] as? String {
            self.shadowColor = value
        }
        if let value = withDictionary[CodingKeys.shadowRadius.rawValue] as? Float {
            self.shadowRadius = value
        }
        if let value = withDictionary[CodingKeys.shadowOpacity.rawValue] as? Double {
            self.shadowOpacity = value
        }
        if let value = withDictionary[CodingKeys.shadowxOffset.rawValue] as? Float {
            self.shadowxOffset = value
        }
        if let value = withDictionary[CodingKeys.shadowyOffset.rawValue] as? Float {
            self.shadowyOffset = value
        }
        
    }
    
    private enum CodingKeys: String, CodingKey {
        case shadowColor = "shadow_color"
        case shadowRadius = "shadow_radius"
        case shadowOpacity = "shadow_opacity"
        case shadowxOffset = "shadow_xoffset"
        case shadowyOffset = "shadow_yoffset"
    }
    
}
