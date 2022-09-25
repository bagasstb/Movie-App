//
//  MovieDetailContract.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

protocol MovieDetailViewProtocol: BaseViewProtocol {
    func setData(with model: MovieItemModel)
    func hidePlayButton()
}

protocol MovieDetailPresenterProtocol: BasePresenterProtocol {
    var movieItemModel: MovieItemModel? { get }
    var trailerModel: TrailerModel? { get }
    func getData()
    func backPressed()
    func reviewPressed()
    func playPressed()
}

protocol MovieDetailWireframeProtocol: BaseWireframeProtocol {
    func popViwController()
    func pushReview(with model: MovieItemModel)
    func pushTrailer(with url: URL)
}

protocol MovieDetailInteractorProtocol: BaseInteractorProtocol {
    func getTrailer(by movieId: String)
}

protocol MovieDetailInteractorDelegate: BaseInteractorDelegate {
    func getTrailerDidSuccess(model: TrailerModel)
}
