//
//  MovieAPI.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

extension Services {
    enum MovieAPI {
        static func getGenre() -> String {
            return "genre/movie/list"
        }
        static func getMovie(genre: String, page: String) -> String {
            return "discover/movie\(Config.keyParam)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=true&page=\(page)&with_genres=\(genre)&with_watch_monetization_types=flatrate"
        }
        static func getMovieReview(id: String, page: String) -> String {
            return "movie/\(id)/reviews\(Config.keyParam)&language=en-US&page=\(page)"
        }
    }
}
