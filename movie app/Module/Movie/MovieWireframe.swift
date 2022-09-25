//
//  MovieWireframe.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation
import UIKit

class MovieWireframe: MovieWireframeProtocol {
    
    weak var controller: MovieViewController?
    
    func setupMovieViewController(with genreItemModel: GenreItemModel) -> MovieViewController {
        let service = MovieService()
        let interactor = MovieInteractor()
        let presenter = MoviePresenter(interactor: interactor, wireframe: self, genreItemModel: genreItemModel)
        let view = MovieViewController()
        interactor.delegate = presenter
        interactor.service = service
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func popController() {
        controller?.navigationController?.popViewController(animated: true)
    }
    
    func pushLogin() {
        
    }
    
    func showNoInternetAlert() {
        
    }
    
    func showErrorAlert(_ message: String, requestType: RequestType?) {
        
    }

}

extension Router {
    
    func setupMovieViewController(with genreItemModel: GenreItemModel) -> MovieViewController {
        let wireframe = MovieWireframe()
        return wireframe.setupMovieViewController(with: genreItemModel)
    }
    
}
