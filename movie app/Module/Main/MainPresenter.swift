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
    
    init(interactor: MainInteractorProtocol, wireframe: MainWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension MainPresenter: MainInteractorDelegate {
    
    func serviceRequestDidFail(_ error: NSError, requestType: RequestType?) {
        
    }
    
    func userUnAuthorized() {
        
    }
    
}
