//
//  SessionManager.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Alamofire

class SessionManager {
    
    static let shared = SessionManager()
    
    func startRequest(with url: URL, method: HTTPMethod, parameters: [String: Any]?, headers: HTTPHeaders?, completed: @escaping (Bool, Data?, Error?) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
                case .success(let data):
                    completed(false, data, nil)
                case .failure(let error):
                    completed(false, nil, error)
            }
        }
    }
    
}

