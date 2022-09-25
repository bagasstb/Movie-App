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
        let service = MovieService()
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(interactor: interactor, wireframe: self, movieItemModel: movieItemModel)
        let view = MovieDetailViewController()
        interactor.delegate = presenter
        interactor.service = service
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func pushTrailer(with url: URL) {
//        guard let url = URL(string: "https://www.youtube.com/embed/xxSlvwYwvtw") else { return }
        
        controller?.showInAppBrowser(with: url)
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
    
    func setupMovieDetailViewController(with movieItemModel: MovieItemModel) -> MovieDetailViewController {
        let wireframe = MovieDetailWireframe()
        return wireframe.setupMovieDetailViewController(with: movieItemModel)
    }
    
}
