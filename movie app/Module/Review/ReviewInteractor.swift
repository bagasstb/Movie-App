//
//  ReviewInteractor.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

class ReviewInteractor: ReviewInteractorProtocol {

    // MARK: Properties
    weak var delegate: ReviewInteractorDelegate?
    var service: MovieServiceProtocol?
    
    func getReview(by movieId: String) {
        service?.getMovieReviewById(id: movieId, success: { [weak self] reviewModel in
            self?.delegate?.getReviewDidSuccess(model: reviewModel)
        }, failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error, requestType: .default)
        }, unauthorized: { [weak self] in
            self?.delegate?.userUnAuthorized()
        })
    }
}
