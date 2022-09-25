//
//  MovieContract.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

protocol MovieViewProtocol: BaseViewProtocol {
    func reloadCollection()
}

protocol MoviePresenterProtocol: BasePresenterProtocol {
    var genreItemModel: GenreItemModel? { get }
    var movieModel: MovieModel? { get }
    var isLoadData: Bool { get set }
    
    func backPressed()
    func getData()
    func movieDidSelect(with index: Int)
}

protocol MovieWireframeProtocol: BaseWireframeProtocol {
    func popController()
    func pushMovieDetail(with movieItemModel: MovieItemModel)
}

protocol MovieInteractorProtocol: BaseInteractorProtocol {
    func getMovie(with genre: String)
}

protocol MovieInteractorDelegate: BaseInteractorDelegate {
    func getMovieDidSuccess(model: MovieModel)
}
