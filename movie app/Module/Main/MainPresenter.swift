//
//  MainPresenter.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

class MainPresenter: MainPresenterProtocol {

    // MARK: Properties
    weak var view: MainViewProtocol?
    let interactor: MainInteractorProtocol
    let wireframe: MainWireframeProtocol
    
    var genreModel: GenreModel? {
        didSet {
            view?.reloadCollection()
        }
    }
    
    init(interactor: MainInteractorProtocol, wireframe: MainWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func getData() {
        interactor.getGenre()
    }
    
    func genrePressed(with index: Int) {
        guard let genre = genreModel?.genres?[index] else { return }
        wireframe.pushMovieList(with: genre)
    }
}

extension MainPresenter: MainInteractorDelegate {
    
    func getGenreDidSuccess(model: GenreModel) {
        genreModel = model
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
