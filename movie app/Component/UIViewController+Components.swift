//
//  UIViewController+Components.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit
import SafariServices

extension UIViewController {
    func setMainNavigation(title: String) {
        let titleButton: UIBarButtonItem = .init(title: title, style: .plain, target: self, action: nil)
        titleButton.setTitleTextAttributes([.font: UIFont.fontAsset(font: .avenirBlack, size: 22), .foregroundColor: UIColor.black], for: .normal)
        navigationItem.leftBarButtonItem = titleButton
    }
    
    func setBackNavigationItem(icon: UIImage = .commonAsset(.back), title: String, action: Selector, backgroundColor: UIColor = .white) {
        self.navigationItem.leftBarButtonItems = [barItem(with: icon, action: action), barItem(with: title)]
        self.navigationController?.navigationBar.backgroundColor = backgroundColor
    }
    
    func showInAppBrowser(with url: URL) {
        let config = SFSafariViewController.Configuration()
        config.barCollapsingEnabled = true

        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
    
    // MARK: - Private function
    
    private func barItem(with title: String) -> UIBarButtonItem {
        let label = UILabel()
        label.textColor = .black
        label.font = .fontAsset(font: .avenirBlack, size: 16.0)
        label.text = title
        let barItem = UIBarButtonItem.init(customView: label)
        return barItem
    }
    
    private func barItem(with icon: UIImage, action: Selector) -> UIBarButtonItem {
        let backImageView: UIImageView = .init(image: icon)
        backImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: action))
        backImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 18)
        backImageView.contentMode = .left
        return UIBarButtonItem.init(customView: backImageView)
    }
}
