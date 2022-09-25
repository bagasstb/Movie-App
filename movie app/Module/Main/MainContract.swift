//
//  MainContract.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

protocol MainViewProtocol: BaseViewProtocol {
    func reloadCollection()
}

protocol MainPresenterProtocol: BasePresenterProtocol {
    var genreModel: GenreModel? { get }
    
    func getData()
}

protocol MainWireframeProtocol: BaseWireframeProtocol {}

protocol MainInteractorProtocol: BaseInteractorProtocol {
    func getGenre()
}

protocol MainInteractorDelegate: BaseInteractorDelegate {
    func getGenreDidSuccess(model: GenreModel)
}
