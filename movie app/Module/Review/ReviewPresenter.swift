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
    var isLoadData: Bool = false
    var reviewModel: ReviewModel?
    var reviews: [ReviewItemModel] = [] {
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
        interactor.getReview(by: movieId, page: 1.description)
    }
    
    func loadMoreData() {
        // MARK: - validate if there is a next page
        if (reviewModel?.page ?? 0) < (reviewModel?.totalPages ?? 0) {
            guard let movieId = movieItemModel?.id?.description else { return }
            let page = (reviewModel?.page ?? 0) + 1
            interactor.getReview(by: movieId, page: page.description)
        }
    }
    
    func backPressed() {
        wireframe.popViewController()
    }
}

extension ReviewPresenter: ReviewInteractorDelegate {
    
    func getReviewDidSuccess(model: ReviewModel) {
        reviewModel = model
        reviews.append(contentsOf: model.results ?? [])
    }
    
    func serviceRequestDidFail(_ error: NSError, requestType: RequestType?) {
        DispatchQueue.main.async { [weak self] in
            self?.wireframe.showErrorAlert(error.description, requestType: .default)
        }
    }
    
    func userUnAuthorized() {
        // MARK: - Implement later if auth feature needed
    }
    
}
