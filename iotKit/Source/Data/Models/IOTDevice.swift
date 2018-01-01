//
//  IOTDevice.swift
//  iotKit
//
//  Created by Seth on 12/30/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import Foundation

protocol IOTDevice: Codable {
    var identifier: String { get set }
    var description: String { get set }
    var name: String { get set }
    var status: String { get set }
    var type: String { get set }
}

struct Device: IOTDevice {
    var identifier: String
    var description: String
    var name: String
    var status: String
    var type: String
}
