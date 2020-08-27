//
//  GradientStyle.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit

class GradientStyle: Codable {
    
    var primaryColor: String?
    var secondaryColor: String?
    var gradientColors: [String]?
    var gradientDirection: GradientDirection?
    var startingPercentage: Float?
    var isVertical: Bool?
    
    init(withDictionary: [String: AnyObject]) {
        
        if let value = withDictionary[CodingKeys.primaryColor.rawValue] as? String {
            self.primaryColor = value
        }
        if let value = withDictionary[CodingKeys.secondaryColor.rawValue] as? String {
            self.secondaryColor = value
        }
        if let value = withDictionary[CodingKeys.gradientColors.rawValue] as? [String] {
            self.gradientColors = value
        }
        if let value = withDictionary[CodingKeys.startingPercentage.rawValue] as? Float {
            self.startingPercentage = value
        }
        if let value = withDictionary[CodingKeys.isVertical.rawValue] as? Bool {
            self.isVertical = value
        }
        if let value = withDictionary[CodingKeys.primaryColor.rawValue] as? Int {
            switch value {
            case 0:
                self.gradientDirection = GradientDirection.GradientDirectionHorizontal
            case 1:
                self.gradientDirection = GradientDirection.GradientDirectionVertical
            default:
                self.gradientDirection = GradientDirection.GradientDirectionDiagonal
            }
        }
        
    }
    
    private enum CodingKeys: String, CodingKey {
        case primaryColor = "gradient_primary_color"
        case secondaryColor = "gradient_secondary_color"
        case gradientDirection = "gradient_direction"
        case startingPercentage = "startingPercentage"
        case isVertical = "isVertical"
        case gradientColors = "gradient_colors"
    }
    
}
