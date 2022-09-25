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
    var trailerModel: TrailerModel?
    
    init(interactor: MovieDetailInteractorProtocol, wireframe: MovieDetailWireframeProtocol, movieItemModel: MovieItemModel) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.movieItemModel = movieItemModel
    }
    
    func getData() {
        guard
            let movieItemModel = movieItemModel,
            let movieId = movieItemModel.id?.description
        else {
            return
        }
        
        interactor.getTrailer(by: movieId)
        view?.setData(with: movieItemModel)
    }
    
    func backPressed() {
        wireframe.popViwController()
    }
    
    func reviewPressed() {
        guard let movieItemModel = movieItemModel else { return }
        wireframe.pushReview(with: movieItemModel)
    }
    
    func playPressed() {
        if (trailerModel?.results?.count ?? 0) > 0 {
            let key = trailerModel?.results?[0].key ?? ""
            guard let url = URL(string: "https://www.youtube.com/embed/" + key) else { return }
            wireframe.pushTrailer(with: url)
        }
    }
}

extension MovieDetailPresenter: MovieDetailInteractorDelegate {
    
    func getTrailerDidSuccess(model: TrailerModel) {
        trailerModel = model
        DispatchQueue.main.async { [weak self] in
            // MARK: - hide button if no video trailer available
            if model.results?.count == 0 {
                self?.view?.hidePlayButton()
            }
        }
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
