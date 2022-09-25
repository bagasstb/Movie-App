//
//  UIView+Components.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

extension UIView {
    
    func makeCircleCorner() {
        layer.cornerRadius = frame.height / 2
    }
    
    func makeCardCorner() {
        layer.cornerRadius = 10
    }
    
    func makeCardShadow(opacity: Float = 0.1) {
        layer.shadowColor = UIColor.colorTheme(.dropShadow).cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = 3
        layer.shadowOffset = .init(width: 1, height: 1)
    }
}
