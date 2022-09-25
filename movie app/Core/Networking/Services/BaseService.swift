//
//  BaseService.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import Alamofire
import Foundation

class Services {
    
    static let shared = Services()
    
    var jsonDecoder: JSONDecoder = { _ -> JSONDecoder in
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }(())
    
    func executeRequest<T: Decodable>(method: HTTPMethod,
                                      url: URL,
                                      parameters: [String: Any]? = nil,
                                      headers: [String: String] = [:],
                                      success: @escaping (T) -> Void,
                                      failure: @escaping (Bool, NSError) -> Void) {
        
        print(">>>>>>>>>>>>> Start Request: \(url)")
        print("Headers: \(String(describing: headers))")
        print("Parameters: \(String(describing: parameters))")
        print("Method: \(method.rawValue)")
        
        SessionManager.shared.startRequest(with: url, method: method, parameters: parameters, headers: nil) { (isCache, data, error) in
            
            
            do {
                #if DEBUG || STAGING || ADHOC
                print(">>>>>>>>>>>>> End of Request: \(url)")
                print("Response: ")
                print("\(String(data: data ?? Data(), encoding: .utf8) ?? "nil")")
                #endif
                
                let result = try self.jsonDecoder.decode(T.self, from: data ?? Data())

                    success(result)
                
            } catch let err as NSError {
                print("Failed request: \(err)")
                failure(isCache, NSError(domain: "MovieService", code: -1, userInfo: ["error": error as Any]))
            }
        }
    }

}


