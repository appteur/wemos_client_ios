//
//  HubSerializer.swift
//  iotKit
//
//  Created by Seth on 12/31/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import Foundation

class HubSerializer {
    
    // key for accessing hubs serialized as json in user defaults
    var storedHubsKey: String = "com.aii.iot.hubs"
    
    func getStoredHubs() -> [Hub] {
        let decoder = JSONDecoder()
        
        // pull from defaults (stored json data) and add any existing hubs
        guard let json = UserDefaults.standard.object(forKey: storedHubsKey) as? Data,
            let stored = try? decoder.decode([Hub].self, from: json) else {
                return []
        }
        
        // we have existing hubs, return them
        return stored
    }
    
    func updateStoredHubs(_ hubs: [Hub]) -> Bool {
        let encoder = JSONEncoder()
        
        // try to encode new json data
        guard let new = try? encoder.encode(hubs) else {
            return false
        }
        
        // save updated results
        UserDefaults.standard.set(new, forKey: storedHubsKey)
        UserDefaults.standard.synchronize()
        
        return true
    }
}
