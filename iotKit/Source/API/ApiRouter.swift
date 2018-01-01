//
//  ApiRouter.swift
//  iotKit
//
//  Created by Seth on 12/30/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import Foundation

protocol ApiRouter {
    var method: String { get }
    var uri: String { get }
    var queryItems: [URLQueryItem]? { get }
    func request(using config: ApiConfiguration) -> URLRequest?
}

extension ApiRouter {
    func request(using config: ApiConfiguration) -> URLRequest? {
        
        // generate url
        var components = URLComponents()
        components.scheme = config.scheme
        components.host = config.host
        components.path = uri
        components.queryItems = queryItems
        
        // verify
        guard let url = components.url else {
            return nil
        }
        
        // generate request
        var request = URLRequest.init(url: url)
        request.httpMethod = method
        
        return request
    }
}

enum WeMosApiRouter: ApiRouter {
    case deviceList
    case deviceAction(String,String)
    
    var method: String {
        return "GET"
    }
    
    var uri: String {
        return "/device"
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .deviceAction(let key, let value):
            let item = URLQueryItem(name: key, value: value)
            return [item]
        default:
            return nil
        }
    }
}
