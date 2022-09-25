//
//  MovieDetailInteractor.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorProtocol {

    // MARK: Properties
    weak var delegate: MovieDetailInteractorDelegate?
    var service: MovieServiceProtocol?
    
    func getTrailer(by movieId: String) {
        service?.getTrailer(id: movieId, success: { [weak self] trailerModel in
            self?.delegate?.getTrailerDidSuccess(model: trailerModel)
        }, failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error, requestType: .default)
        }, unauthorized: { [weak self] in
            self?.delegate?.userUnAuthorized()
        })
    }
}
