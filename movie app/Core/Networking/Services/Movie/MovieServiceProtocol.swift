//
//  MovieServiceProtocol.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

protocol MovieServiceProtocol {
    
    func getGenre(success: @escaping (GenreModel) -> Void, failure: @escaping (NSError) -> Void, unauthorized: @escaping () -> Void)
    
}
