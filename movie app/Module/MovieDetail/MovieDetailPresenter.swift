//
//  MovieDetailPresenter.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {

    // MARK: Properties
    weak var view: MovieDetailViewProtocol?
    let interactor: MovieDetailInteractorProtocol
    let wireframe: MovieDetailWireframeProtocol
    
    var movieItemModel: MovieItemModel?
    
    init(interactor: MovieDetailInteractorProtocol, wireframe: MovieDetailWireframeProtocol, movieItemModel: MovieItemModel) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.movieItemModel = movieItemModel
    }
    
    func getData() {
        guard let movieItemModel = movieItemModel else { return }
        view?.setData(with: movieItemModel)
    }
    
    func backPressed() {
        wireframe.popViwController()
    }
    
    func reviewPressed() {
        guard let movieItemModel = movieItemModel else { return }
        wireframe.pushReview(with: movieItemModel)
    }
}

extension MovieDetailPresenter: MovieDetailInteractorDelegate {
    
    func serviceRequestDidFail(_ error: NSError, requestType: RequestType?) {
        
    }
    
    func userUnAuthorized() {
        
    }
    
}
