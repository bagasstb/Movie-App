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
    }
}
