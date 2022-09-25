//
//  TrailerModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

struct TrailerModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case id = "id"
    }
    
    var results: [TrailerItemModel]?
    var id: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decodeIfPresent([TrailerItemModel].self, forKey: .results)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    
}
