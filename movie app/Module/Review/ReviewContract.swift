//
//  ReviewContract.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import Foundation

protocol ReviewViewProtocol: BaseViewProtocol {
    func reloadTable()
}

protocol ReviewPresenterProtocol: BasePresenterProtocol {
    var movieItemModel: MovieItemModel? { get }
    var reviewModel: ReviewModel? { get }
    var reviews: [ReviewItemModel] { get }
    var isLoadData: Bool { get set }
    
    func backPressed()
    func getData()
    func loadMoreData()
}

protocol ReviewWireframeProtocol: BaseWireframeProtocol {
    func popViewController()
}

protocol ReviewInteractorProtocol: BaseInteractorProtocol {
    func getReview(by movieId: String, page: String)
}

protocol ReviewInteractorDelegate: BaseInteractorDelegate {
    func getReviewDidSuccess(model: ReviewModel)
}
