//
//  DeviceListCellViewModel.swift
//  iotKit
//
//  Created by Seth on 12/30/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import Foundation

class DeviceListCellViewModel {
    var device: IOTDevice
    
    // takes device identifier and 0,1 to turn device on/off
    var onStateChange: ((String?, Int?) -> Void)?
    
    init(device: IOTDevice) {
        self.device = device
    }
    
    func didUpdateButtonState() {
        
        // toggle current status
        let newStat = device.status == "0" ? 1 : 0
        
        // update the api
        onStateChange?(device.identifier, newStat)
        
        // update the device
        device.status = "\(newStat)"
    }
    
    func toggleTitle() -> String {
        return device.status == "0" ? "Turn Off" : "Turn On"
    }
}
