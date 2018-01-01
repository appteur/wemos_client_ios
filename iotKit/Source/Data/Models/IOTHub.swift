//
//  IOTHub.swift
//  iotKit
//
//  Created by Seth on 12/31/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import Foundation

protocol IOTHub: ApiConfiguration, Codable {
    // descriptive name for the hub
    var name: String { get set }
    // description, what does it do? where is it located? etc...
    var description: String { get set }
}

struct Hub: IOTHub {
    var name: String
    var host: String
    var scheme: String
    var description: String
}
