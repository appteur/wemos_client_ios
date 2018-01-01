//
//  Network.swift
//  iotKit
//
//  Created by Seth on 12/30/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import Foundation

class NetworkProvider {
    var config: ApiConfiguration
    var session: URLSession
    
    init(config: ApiConfiguration) {
        self.config = config
        session = URLSession.shared
    }
    
    func getDeviceList(completion: @escaping (Data?, Error?) -> Void) {
        let service = WeMosApiRouter.deviceList
        guard let request = service.request(using: config) else {
            // todo handle completion with error here
            return
        }
        
        processRequest(request) { (data, response, error) in
            completion(data, error)
        }
    }
    
    func updateDevice(identifier: String, value: String) {
        let service = WeMosApiRouter.deviceAction(identifier, value)
        guard let request = service.request(using: config) else {
            // todo handle completion with error here
            return
        }
        
        processRequest(request) { (data, response, error) in
//            completion(data, error)
        }
    }
    
    func processRequest(_ request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        print("Network Request: \(String(describing: request.url?.absoluteString))")
        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
            self?.logResponse(data)
            completion(data, response, error)
        }
        task.resume()
    }
    
    func logResponse(_ data: Data?) {
        guard let data = data else {
            print("Nil response data")
            return
        }
        
        let string = String.init(data: data, encoding: .utf8)
        print("Response: \(String(describing: string))")
    }
}
