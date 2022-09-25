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
}

protocol MovieDetailWireframeProtocol: BaseWireframeProtocol {
    func popViwController()
}

protocol MovieDetailInteractorProtocol: BaseInteractorProtocol {}

protocol MovieDetailInteractorDelegate: BaseInteractorDelegate {}
