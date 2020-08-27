//
//  TextScaling.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

class TextScaling: Codable {
    
    var shrinkText: Bool?
    var minimumScale: Float?
    
    init(withDictionary: [String: AnyObject]) {
        
        if let value = withDictionary[CodingKeys.minimumScale.rawValue] as? Float {
            self.minimumScale = value
        }
        if let value = withDictionary[CodingKeys.shrinkText.rawValue] as? Bool {
            self.shrinkText = value
        }
        
    }
    
    private enum CodingKeys: String, CodingKey {
        case shrinkText = "shrinkText"
        case minimumScale = "minimumScale"
    }
    
}
