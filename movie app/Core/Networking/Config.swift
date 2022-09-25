//
//  Config.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 24/09/22.
//

import Foundation

struct Config {
    
    static let shared = Config()
    static let key = "be3dd011af80c6488d69372bfce04105"
    static let keyParam = "?api_key=\(key)"
    
    static let baseURL: String = {
        return BuildType.build()
    }().rawValue
    
}

// MARK: - Built Type

struct BuildType {
    
    private static let type: Build = {
        #if DEBUG
        return Build.debug
        #elseif ADHOC
        return Build.staging
        #elseif STAGING
        return Build.staging
        #else
        return Build.release
        #endif
    }()
    
    static func build() -> Build {
        return self.type
    }
}

enum Build: String {
    // MARK: - base url env
    case staging, debug = "https://api.themoviedb.org/3/"
    case release = ""
}
