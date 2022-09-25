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
        static func getMovie(genre: String) -> String {
            return "discover/movie?api_key=be3dd011af80c6488d69372bfce04105&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=true&page=1&with_genres=\(genre)&with_watch_monetization_types=flatrate"
        }
    }
}
