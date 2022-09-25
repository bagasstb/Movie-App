//
//  ReviewPresenter.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

class ReviewPresenter: ReviewPresenterProtocol {

    // MARK: Properties
    weak var view: ReviewViewProtocol?
    let interactor: ReviewInteractorProtocol
    let wireframe: ReviewWireframeProtocol
    
    var movieItemModel: MovieItemModel?
    var reviewModel: ReviewModel? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view?.reloadTable()
            }
        }
    }
    
    init(interactor: ReviewInteractorProtocol, wireframe: ReviewWireframeProtocol, movieItemModel: MovieItemModel) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.movieItemModel = movieItemModel
    }
    
    func getData() {
        guard let movieId = movieItemModel?.id?.description else { return }
        interactor.getReview(by: movieId)
    }
    
    func backPressed() {
        wireframe.popViewController()
    }
}

extension ReviewPresenter: ReviewInteractorDelegate {
    
    func getReviewDidSuccess(model: ReviewModel) {
        reviewModel = model
    }
    
    func serviceRequestDidFail(_ error: NSError, requestType: RequestType?) {
        
    }
    
    func userUnAuthorized() {
        
    }
    
}
