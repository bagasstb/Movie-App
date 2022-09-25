//
//  GenreItemModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 24/09/22.
//

import Foundation

struct GenreItemModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
    }
    
    var name: String?
    var id: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    
}

