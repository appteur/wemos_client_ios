//
//  NewHubViewModel.swift
//  iotKit
//
//  Created by Seth on 12/31/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import Foundation

protocol NewHubDelegate: class {
    func didUpdateHubs(_ hubs: [Hub])
}

class NewHubViewModel {
    
    weak var delegate: NewHubDelegate?
    var hubProvider: HubSerializer
    
    init(hubProvider: HubSerializer) {
        self.hubProvider = hubProvider
    }
    
    func saveHub(name: String?, domain: String?, scheme: String?, description: String?) -> Bool {
        
        // validate
        guard let name = name, name.count > 0,
            let ip = domain, ip.count > 0,
            let scheme = scheme, scheme.count > 0,
            let desc = description, desc.count > 0 else {
                return false
        }
        
        // get any existing hubs
        var hubs: [Hub] = hubProvider.getStoredHubs()
        
        // create our hub object from provided details & add to list
        hubs.append(Hub(name: name, host: ip, scheme: scheme, description: desc))
        
        // save updated hubs
        guard hubProvider.updateStoredHubs(hubs) == true else {
            return false
        }
        
        // notify delegate
        delegate?.didUpdateHubs(hubs)
        
        return true
    }
    
}
