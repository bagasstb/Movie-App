//
//  MainWireframe.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

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
    
    func pushLogin() {
        // MARK: - Implement call login page later if auth feature available
    }
    
    func showNoInternetAlert() {
        // MARK: - Implement connection detection for improvement
    }
    
    func showErrorAlert(_ message: String, requestType: RequestType?) {
        let alert = UIAlertController(title: "Something Wrong", message: "Please wait or try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        controller?.present(alert, animated: true, completion: nil)
    }

}

extension Router {
    
    func setupMainViewController() -> MainViewController {
        let wireframe = MainWireframe()
        return wireframe.setupMainViewController()
    }
    
}
