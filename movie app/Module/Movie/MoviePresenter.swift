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
    var isLoadData: Bool = false
    var movies: [MovieItemModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view?.reloadCollection()
            }
        }
    }
    var movieModel: MovieModel?
    
    init(interactor: MovieInteractorProtocol, wireframe: MovieWireframeProtocol, genreItemModel: GenreItemModel) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.genreItemModel = genreItemModel
    }
    
    func getData() {
        guard let genre = genreItemModel?.id?.description else { return }
        interactor.getMovie(with: genre, page: 1.description)
    }
    
    func loadMoreData() {
        if (movieModel?.page ?? 0) < (movieModel?.totalPages ?? 0) {
            guard let genre = genreItemModel?.id?.description else { return }
            let page = (movieModel?.page ?? 0) + 1
            interactor.getMovie(with: genre, page: page.description)
        }
    }
    
    func backPressed() {
        wireframe.popController()
    }
    
    func movieDidSelect(with index: Int) {
        let model = movies[index]
        wireframe.pushMovieDetail(with: model)
    }
}

extension MoviePresenter: MovieInteractorDelegate {
    
    func getMovieDidSuccess(model: MovieModel) {
        movieModel = model
        movies.append(contentsOf: model.results ?? [])
        isLoadData = false
    }
    
    func serviceRequestDidFail(_ error: NSError, requestType: RequestType?) {
        
    }
    
    func userUnAuthorized() {
        // MARK: - Implement later if auth feature needed
    }
    
}
