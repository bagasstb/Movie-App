//
//  ReviewModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

struct ReviewModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalPages = "total_pages"
        case results = "results"
        case totalResults = "total_results"
        case id = "id"
    }
    
    var page: Int?
    var totalPages: Int?
    var results: [ReviewItemModel]?
    var totalResults: Int?
    var id: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        page = try container.decodeIfPresent(Int.self, forKey: .page)
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        results = try container.decodeIfPresent([ReviewItemModel].self, forKey: .results)
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    
}

