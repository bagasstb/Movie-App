//
//  UIImage+Extension.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

extension UIImage {
    static func commonAsset(_ assetName: CommonAsset) -> UIImage {
        return UIImage(named: assetName.rawValue) ?? UIImage()
    }
}
