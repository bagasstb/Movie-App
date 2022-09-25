//
//  UIColor+Extension.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

extension UIColor {
    
    static func colorTheme(_ color: ColorAsset) -> UIColor {
        return color.associatedColor
    }
    
    @nonobjc class var greyish: UIColor {
        return UIColor(red: 30.0 / 255.0, green: 68.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
    }
    
}
