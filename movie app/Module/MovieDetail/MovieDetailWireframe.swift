//
//  MovieDetailWireframe.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation
import UIKit

class MovieDetailWireframe: MovieDetailWireframeProtocol {
    
    weak var controller: MovieDetailViewController?
    
    func setupMovieDetailViewController(with movieItemModel: MovieItemModel) -> MovieDetailViewController {
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(interactor: interactor, wireframe: self, movieItemModel: movieItemModel)
        let view = MovieDetailViewController()
        interactor.delegate = presenter
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func popViwController() {
        controller?.navigationController?.popViewController(animated: true)
    }
    
    func pushReview(with model: MovieItemModel) {
        let router = Router()
        let reviewViewController = router.setupReviewViewController(movieItemModel: model)
        controller?.navigationController?.pushViewController(reviewViewController, animated: true)
    }
    
    func pushLogin() {
        
    }
    
    func showNoInternetAlert() {
        
    }
    
    func showErrorAlert(_ message: String, requestType: RequestType?) {
        
    }

}

extension Router {
    
    func setupMovieDetailViewController(with movieItemModel: MovieItemModel) -> MovieDetailViewController {
        let wireframe = MovieDetailWireframe()
        return wireframe.setupMovieDetailViewController(with: movieItemModel)
    }
    
}
