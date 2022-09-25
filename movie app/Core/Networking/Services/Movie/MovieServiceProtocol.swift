//
//  MovieServiceProtocol.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

protocol MovieServiceProtocol {
    
    func getGenre(success: @escaping (GenreModel) -> Void, failure: @escaping (NSError) -> Void, unauthorized: @escaping () -> Void)
    func getMovieByGenre(genre: String, page: String, success: @escaping (MovieModel) -> Void, failure: @escaping (NSError) -> Void, unauthorized: @escaping () -> Void)
    func getMovieReviewById(id: String, page: String, success: @escaping (ReviewModel) -> Void, failure: @escaping (NSError) -> Void, unauthorized: @escaping () -> Void)
    func getTrailer(id: String, success: @escaping (TrailerModel) -> Void, failure: @escaping (NSError) -> Void, unauthorized: @escaping () -> Void)
}
