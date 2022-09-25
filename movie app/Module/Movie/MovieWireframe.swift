//
//  MovieWireframe.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation
import UIKit

class MovieWireframe: MovieWireframeProtocol {
    
    weak var controller: MovieViewController?
    
    func setupMovieViewController(with genreItemModel: GenreItemModel) -> MovieViewController {
        let service = MovieService()
        let interactor = MovieInteractor()
        let presenter = MoviePresenter(interactor: interactor, wireframe: self, genreItemModel: genreItemModel)
        let view = MovieViewController()
        interactor.delegate = presenter
        interactor.service = service
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func pushMovieDetail(with movieItemModel: MovieItemModel) {
        let router = Router()
        let movieDetailController = router.setupMovieDetailViewController(with: movieItemModel)
        controller?.navigationController?.pushViewController(movieDetailController, animated: true)
    }
    
    func popController() {
        controller?.navigationController?.popViewController(animated: true)
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
    
    func setupMovieViewController(with genreItemModel: GenreItemModel) -> MovieViewController {
        let wireframe = MovieWireframe()
        return wireframe.setupMovieViewController(with: genreItemModel)
    }
    
}
