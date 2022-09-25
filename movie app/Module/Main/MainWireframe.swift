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
        let service = MovieService()
        let interactor = MainInteractor()
        let presenter = MainPresenter(interactor: interactor, wireframe: self)
        let view = MainViewController()
        interactor.delegate = presenter
        interactor.service = service
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func pushMovieList(with genreItemModel: GenreItemModel) {
        let router = Router()
        let movieController = router.setupMovieViewController(with: genreItemModel)
        controller?.navigationController?.pushViewController(movieController, animated: true)
    }
    
    func pushMovieList() {
        
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
