//
//  UIViewController+Components.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

extension UIViewController {
    func setMainNavigation(title: String) {
        let titleButton: UIBarButtonItem = .init(title: title, style: .plain, target: self, action: nil)
        titleButton.setTitleTextAttributes([.font: UIFont.fontAsset(font: .avenirBlack, size: 22), .foregroundColor: UIColor.black], for: .normal)
        navigationItem.leftBarButtonItem = titleButton
        
        
    }
}
