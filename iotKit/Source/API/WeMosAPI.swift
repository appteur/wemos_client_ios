//
//  ApiConfiguration.swift
//  iotKit
//
//  Created by Seth on 12/30/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import Foundation

protocol ApiConfiguration {
    var scheme: String { get }
    var host: String { get }
}
