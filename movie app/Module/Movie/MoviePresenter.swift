//
//  MoviePresenter.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

class MoviePresenter: MoviePresenterProtocol {

    // MARK: Properties
    weak var view: MovieViewProtocol?
    let interactor: MovieInteractorProtocol
    let wireframe: MovieWireframeProtocol
    
    var genreItemModel: GenreItemModel?
    var movieModel: MovieModel? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view?.reloadCollection()
            }
        }
    }
    
    init(interactor: MovieInteractorProtocol, wireframe: MovieWireframeProtocol, genreItemModel: GenreItemModel) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.genreItemModel = genreItemModel
    }
    
    func getData() {
        guard let genre = genreItemModel?.id?.description else { return }
        interactor.getMovie(with: genre)
    }
    
    func backPressed() {
        wireframe.popController()
    }
    
    func movieDidSelect(with index: Int) {
        guard let model = movieModel?.results?[index] else { return }
        wireframe.pushMovieDetail(with: model)
    }
}

extension MoviePresenter: MovieInteractorDelegate {
    
    func getMovieDidSuccess(model: MovieModel) {
        movieModel = model
    }
    
    func serviceRequestDidFail(_ error: NSError, requestType: RequestType?) {
        
    }
    
    func userUnAuthorized() {
        // MARK: - Implement later if auth feature needed
    }
    
}
