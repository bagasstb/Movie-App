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
        
    }
    
    func showNoInternetAlert() {
        
    }
    
    func showErrorAlert(_ message: String, requestType: RequestType?) {
        
    }

}

extension Router {
    
    func setupReviewViewController(movieItemModel: MovieItemModel) -> ReviewViewController {
        let wireframe = ReviewWireframe()
        return wireframe.setupReviewViewController(movieItemModel: movieItemModel)
    }
    
}
