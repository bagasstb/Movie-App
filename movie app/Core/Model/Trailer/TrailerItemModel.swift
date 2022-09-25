//
//  TrailerItemModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

struct TrailerItemModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case size = "size"
        case key = "key"
        case id = "id"
        case site = "site"
        case official = "official"
        case name = "name"
        case iso31661 = "iso_3166_1"
        case iso6391 = "iso_639_1"
        case type = "type"
        case publishedAt = "published_at"
    }
    
    var size: Int?
    var key: String?
    var id: String?
    var site: String?
    var official: Bool?
    var name: String?
    var iso31661: String?
    var iso6391: String?
    var type: String?
    var publishedAt: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        size = try container.decodeIfPresent(Int.self, forKey: .size)
        key = try container.decodeIfPresent(String.self, forKey: .key)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        site = try container.decodeIfPresent(String.self, forKey: .site)
        official = try container.decodeIfPresent(Bool.self, forKey: .official)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        iso31661 = try container.decodeIfPresent(String.self, forKey: .iso31661)
        iso6391 = try container.decodeIfPresent(String.self, forKey: .iso6391)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
    }
    
}
