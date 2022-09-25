//
//  MovieInteractor.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

class MovieInteractor: MovieInteractorProtocol {

    // MARK: Properties
    weak var delegate: MovieInteractorDelegate?
    var service: MovieServiceProtocol?
    
    func getMovie(with genre: String, page: String) {
        service?.getMovieByGenre(genre: genre, page: page, success: { [weak self] movieModel in
            self?.delegate?.getMovieDidSuccess(model: movieModel)
        }, failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error, requestType: .default)
        }, unauthorized: { [weak self] in
            self?.delegate?.userUnAuthorized()
        })
    }
}
