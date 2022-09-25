//
//  Size+Utils.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

struct SizeUtils {
    
    static let shared = SizeUtils()
    
    let screenHeight: CGFloat = {
        return UIScreen.main.bounds.height
    }()
    
    let screenWidth: CGFloat = {
        return UIScreen.main.bounds.width
    }()
}
