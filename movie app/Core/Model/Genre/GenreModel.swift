//
//  GenreModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 24/09/22.
//

import Foundation

struct GenreModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
    
    var genres: [GenreItemModel]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        genres = try container.decodeIfPresent([GenreItemModel].self, forKey: .genres)
    }
    
}
