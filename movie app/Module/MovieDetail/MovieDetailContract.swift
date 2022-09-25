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
}

protocol MovieDetailPresenterProtocol: BasePresenterProtocol {
    var movieItemModel: MovieItemModel? { get }
    
    func getData()
    func backPressed()
    func reviewPressed()
}

protocol MovieDetailWireframeProtocol: BaseWireframeProtocol {
    func popViwController()
    func pushReview(with model: MovieItemModel)
}

protocol MovieDetailInteractorProtocol: BaseInteractorProtocol {}

protocol MovieDetailInteractorDelegate: BaseInteractorDelegate {}