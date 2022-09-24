//
//  BaseContract.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    
}

protocol BasePresenterProtocol: AnyObject {

}

protocol BaseInteractorProtocol: AnyObject {
    
}

protocol BaseWireframeProtocol: AnyObject {
    
    /// Push to login when response is 401 / UnAuthorized
    func pushLogin()
    
    /// Show dialog no internet connection
    func showNoInternetAlert()
    
    /// Show alert dialog with
    /// - Parameters:
    ///   - message: Alert message
    ///   - requestType: Failed source
    func showErrorAlert(_ message: String, requestType: RequestType?)
}

protocol BaseInteractorDelegate: AnyObject {
    
    /// Assign type based on request use for
    /// - Parameters:
    ///   - error: Error description
    ///   - requestType: Failed source
    func serviceRequestDidFail(_ error: NSError, requestType: RequestType?)

    /// Service succeed with status code 401
    func userUnAuthorized()
}
