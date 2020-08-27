//
//  ThemableLabel.swift
//  WunderDemo
//
//  Created by Karem Gohar on 27.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit

class ThemableLabel: UILabel, ThemableObject {
    
    @objc var styleKey: String?
    var themeStyle: ThemeStyle!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let key = styleKey {
            if let theme = ThemeManager.sharedInstance.getThemeOf(type: .themableObjectOfTypeLabel, themeStyleKey: key, locale: nil) {
                themeStyle = theme
                self.apply(theme: theme)
            }
        }
    }
    
    func apply(theme: ThemeStyle) {
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        if let value = theme.fontColor {
            self.textColor = UIColor(hexString: value)
        }
        if let value = theme.fontSize {
            if let font = theme.fontFamily {
                self.font = UIFont(name: font, size: value)
            } else {
                self.font = UIFont.systemFont(ofSize: value)
            }
        }
        if let value = theme.backgroundColor {
            if value == "0" {
                self.backgroundColor = .clear
            } else {
                if let alpha = theme.alpha {
                    self.backgroundColor = UIColor(hexString: value).withAlphaComponent(alpha)
                } else {
                    self.backgroundColor = UIColor(hexString: value)
                }
            }
        }
        if let value = theme.boldFont {
            if value {
                if let size = theme.fontSize {
                    if let font = theme.fontFamily {
                        self.font = UIFont(name: font, size: size)
                    } else {
                        self.font = UIFont.boldSystemFont(ofSize: size)
                    }
                }
            }
        }
        if let value = theme.borderStyle {
            if let corner = value.cornerRadius {
                self.layer.masksToBounds = true
                self.layer.cornerRadius = CGFloat(corner)
            }
            if let corner = value.borderWidth {
                self.layer.borderWidth = CGFloat(corner)
            }
            if let corner = value.borderColor {
                self.layer.borderColor = UIColor(hexString: corner).cgColor
            }
        }
        if let value = theme.textAlignment {
            switch value {
            case .TextAlignmentCenter:
                self.textAlignment = .center
                break
            case .TextAlignmentRight:
                self.textAlignment = .right
                break
            default:
                self.textAlignment = .left
                break
            }
        }
        if let value = theme.shadow {
            if let color = value.shadowColor {
                self.layer.shadowColor = UIColor(hexString: color).cgColor
            }
            if let opacity = value.shadowOpacity {
                self.layer.shadowOpacity = Float(opacity)
            }
            if let radius = value.shadowRadius {
                self.layer.shadowRadius = CGFloat(radius)
            }
            if let xOffSet = value.shadowxOffset, let yOffSet = value.shadowyOffset {
                self.layer.shadowOffset = CGSize(width: CGFloat(xOffSet), height: CGFloat(yOffSet))
            }
            self.layer.masksToBounds = false
            self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
        }
        if let value = theme.isCircle {
            if value {
                let height = self.frame.size.height
                self.layer.masksToBounds = true
                self.layer.cornerRadius = height / 2
            }
        }
        if let value = theme.isUnderlined {
            if value {
                if let text = self.text {
                    let attributedString = NSMutableAttributedString(string: text)
                    attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
                    self.attributedText = attributedString
                    self.text = ""
                }
            }
        }
        if let value = theme.backgroundGradient {
            if let primaryColor = value.primaryColor {
                if let secondaryColor = value.secondaryColor {
                    if let vertical = value.isVertical {
                        self.setGradientBackground(colorOne: UIColor(hexString: primaryColor), colorTwo: UIColor(hexString: secondaryColor), isVertical: vertical)
                    } else {
                        self.setGradientBackground(colorOne: UIColor(hexString: primaryColor), colorTwo: UIColor(hexString: secondaryColor), isVertical: false)
                    }
                }
            }
        }
    }
    
}
