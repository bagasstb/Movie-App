//
//  MainInteractor.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

class MainInteractor: MainInteractorProtocol {

    // MARK: Properties
    weak var delegate: MainInteractorDelegate?
    var service: MovieServiceProtocol?
    
    func getGenre() {
        service?.getGenre(success: { [weak self] genreModel in
            self?.delegate?.getGenreDidSuccess(model: genreModel)
        }, failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error, requestType: .default)
        }, unauthorized: { [weak self] in
            self?.delegate?.userUnAuthorized()
        })
    }
}
