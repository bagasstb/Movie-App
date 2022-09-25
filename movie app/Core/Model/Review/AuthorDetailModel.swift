//
//  AuthorDetailModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation

struct AuthorDetailModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
        case name = "name"
        case rating = "rating"
        case username = "username"
    }
    
    var avatarPath: String?
    var name: String?
    var rating: Int?
    var username: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        avatarPath = try container.decodeIfPresent(String.self, forKey: .avatarPath)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        rating = try container.decodeIfPresent(Int.self, forKey: .rating)
        username = try container.decodeIfPresent(String.self, forKey: .username)
    }
    
}

