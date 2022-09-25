//
//  MovieModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

struct MovieModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case results = "results"
        case page = "page"
        case totalPages = "total_pages"
    }
    
    var totalResults: Int?
    var results: [MovieItemModel]?
    var page: Int?
    var totalPages: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        results = try container.decodeIfPresent([MovieItemModel].self, forKey: .results)
        page = try container.decodeIfPresent(Int.self, forKey: .page)
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
    }
    
}

