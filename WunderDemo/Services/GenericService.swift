//
//  GenericService.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import Foundation

enum HTTPMethodType: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

class GenericService<GenericResponseModel: Codable>  {
    
    var session: URLSession?
    var configuration: URLSessionConfiguration!
    var dataTask: URLSessionDataTask?
    
    init() {
        configuration = URLSessionConfiguration.ephemeral
        configuration.waitsForConnectivity = true
        configuration.allowsCellularAccess = true
        configuration.httpMaximumConnectionsPerHost = 2
        session = URLSession(configuration: configuration)
    }
    
    func fireRequest(url: URL, completion: ((GenericResponseModel?, Error?) -> Void)?) {
        dataTask = session?.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                completion?(nil, error)
            } else if let responseObject = self.buildObjectFromResponse(data: data) {
                completion?(responseObject, nil)
            } else {
                let customError = NSError(domain: "Unkown Error Happend", code: -1, userInfo: nil)
                completion?(nil, customError)
            }
        })
        dataTask?.resume()
    }
    
    // MARK: Private Methods
    private func buildObjectFromResponse(data: Data?) -> GenericResponseModel? {
        var object: GenericResponseModel?
        do {
            object = try JSONDecoder().decode(GenericResponseModel.self , from: data!)
        } catch (let error){
            print(error)
        }
        return object
    }
}
