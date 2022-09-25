//
//  ReviewWireframe.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation
import UIKit

class ReviewWireframe: ReviewWireframeProtocol {
    
    weak var controller: ReviewViewController?
    
    func setupReviewViewController(movieItemModel: MovieItemModel) -> ReviewViewController {
        let service = MovieService()
        let interactor = ReviewInteractor()
        let presenter = ReviewPresenter(interactor: interactor, wireframe: self, movieItemModel: movieItemModel)
        let view = ReviewViewController()
        interactor.delegate = presenter
        interactor.service = service
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func popViewController() {
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
    
    func setupReviewViewController(movieItemModel: MovieItemModel) -> ReviewViewController {
        let wireframe = ReviewWireframe()
        return wireframe.setupReviewViewController(movieItemModel: movieItemModel)
    }
    
}
