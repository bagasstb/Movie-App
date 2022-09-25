//
//  UIColor+Theme.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

enum ColorAsset {
    case dropShadow
    
    var associatedColor: UIColor {
        switch self {
        case .dropShadow: return .greyish
        }
    }
}
