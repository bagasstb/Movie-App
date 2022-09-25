//
//  ReviewItemModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

struct ReviewItemModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case id = "id"
        case url = "url"
        case authorDetails = "author_details"
        case author = "author"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
    }
    
    var content: String?
    var id: String?
    var url: String?
    var authorDetails: AuthorDetailModel?
    var author: String?
    var updatedAt: String?
    var createdAt: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        content = try container.decodeIfPresent(String.self, forKey: .content)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        authorDetails = try container.decodeIfPresent(AuthorDetailModel.self, forKey: .authorDetails)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
    }
    
}

