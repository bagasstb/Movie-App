//
//  MainWireframe.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation
import UIKit

class MainWireframe: MainWireframeProtocol {
    
    weak var controller: MainViewController?
    
    func setupMainViewController() -> MainViewController {
        let interactor = MainInteractor()
        let presenter = MainPresenter(interactor: interactor, wireframe: self)
        let view = MainViewController()
        interactor.delegate = presenter
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func pushLogin() {
        
    }
    
    func showNoInternetAlert() {
        
    }
    
    func showErrorAlert(_ message: String, requestType: RequestType?) {
        
    }

}

extension Router {
    
    func setupMainViewController() -> MainViewController {
        let wireframe = MainWireframe()
        return wireframe.setupMainViewController()
    }
    
}
