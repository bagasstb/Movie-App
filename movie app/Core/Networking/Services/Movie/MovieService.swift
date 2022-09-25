//
//  MovieService.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

class MovieService: Services, MovieServiceProtocol {
    
    static let authService = MovieService()
    
    func getGenre(success: @escaping (GenreModel) -> Void, failure: @escaping (NSError) -> Void, unauthorized: @escaping () -> Void) {
        guard let url = URL(string: Config.baseURL + MovieAPI.getGenre() + Config.keyParam) else { return }
        
        Services.shared.executeRequest(method: .get, url: url,
        success: { (response) in
            success(response)
        }, failure: { _, error in
            self.handleErrorRequest(error: error, fail: failure, unauth: unauthorized)
        })
    }
    
    func getMovieByGenre(genre: String, page: String, success: @escaping (MovieModel) -> Void, failure: @escaping (NSError) -> Void, unauthorized: @escaping () -> Void) {
        guard let url = URL(string: Config.baseURL + MovieAPI.getMovie(genre: genre, page: page)) else { return }
        
        Services.shared.executeRequest(method: .get, url: url,
        success: { (response) in
            success(response)
        }, failure: { _, error in
            self.handleErrorRequest(error: error, fail: failure, unauth: unauthorized)
        })
    }
    
    func getMovieReviewById(id: String, page: String, success: @escaping (ReviewModel) -> Void, failure: @escaping (NSError) -> Void, unauthorized: @escaping () -> Void) {
        guard let url = URL(string: Config.baseURL + MovieAPI.getMovieReview(id: id, page: page)) else { return }
        
        Services.shared.executeRequest(method: .get, url: url,
        success: { (response) in
            success(response)
        }, failure: { _, error in
            self.handleErrorRequest(error: error, fail: failure, unauth: unauthorized)
        })
    }
    
    func handleErrorRequest(error: NSError, fail: @escaping (NSError) -> Void, unauth: @escaping () -> Void) {
        switch error.code {
        case 401:
            unauth()
        default:
            fail(error)
        }
    }
}
