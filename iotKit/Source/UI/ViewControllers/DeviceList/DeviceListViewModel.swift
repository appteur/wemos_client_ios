//
//  DeviceListViewModel.swift
//  iotKit
//
//  Created by Seth on 12/30/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import UIKit

class DeviceListViewModel: NSObject {
    
    let network: NetworkProvider
    var hub: Hub
    var devices: [Device] = []
    
    init(hub: Hub) {
        self.hub = hub
        
        network = NetworkProvider.init(config: hub)
    }
    
    func sectionCount() -> Int {
        return 1
    }
    
    func deviceCount() -> Int {
        return devices.count
    }
    
    func loadDeviceList(completion: @escaping (Bool) -> Void) {
        // fetch list from api
        network.getDeviceList { [weak self] (data, error) in
            guard let strongSelf = self else {
                completion(false)
                return
            }
            
            // parse & add to devices
            let decoder = JSONDecoder()
            guard let data = data, let list = try? decoder.decode([Device].self, from: data) else {
                // todo throw error here
                completion(false)
                return
            }
            
            DispatchQueue.main.async {
                print("Updating device list now...")
                strongSelf.devices.append(contentsOf: list)
                // call completion with true
                completion(true)
            }
        }
    }
    
    func deviceListItemViewModel(for indexPath: IndexPath) -> DeviceListCellViewModel? {
        guard indexPath.row < devices.count else {
            return nil
        }
        let model = DeviceListCellViewModel.init(device: devices[indexPath.row])
        model.onStateChange = { [weak self] (identifier, selectedIndex) in
            guard let strongSelf = self, let identifier = identifier, let index = selectedIndex else {
                return
            }
            strongSelf.network.updateDevice(identifier: identifier, value: "\(index)")
        }
        return model
    }
}
