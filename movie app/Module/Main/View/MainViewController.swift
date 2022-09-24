//
//  MainViewController.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: MainPresenterProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        
    }

}

// MARK: - View Protocol
extension MainViewController: MainViewProtocol {}
