//
//  MovieItemModel.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Foundation


import Foundation

struct MovieItemModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case video = "video"
        case adult = "adult"
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case voteCount = "vote_count"
        case originalLanguage = "original_language"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case overview = "overview"
        case posterPath = "poster_path"
        case id = "id"
        case backdropPath = "backdrop_path"
    }
    
    var title: String?
    var video: Bool?
    var adult: Bool?
    var voteAverage: Float?
    var genreIds: [Int]?
    var originalTitle: String?
    var voteCount: Int?
    var originalLanguage: String?
    var popularity: Float?
    var releaseDate: String?
    var overview: String?
    var posterPath: String?
    var id: Int?
    var backdropPath: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        video = try container.decodeIfPresent(Bool.self, forKey: .video)
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
        genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    }
    
}
