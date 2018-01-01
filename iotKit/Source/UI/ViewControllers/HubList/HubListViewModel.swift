//
//  HubListViewModel.swift
//  iotKit
//
//  Created by Seth on 12/31/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import UIKit

class HubListViewModel: NewHubDelegate {
    
    // tracks active hubs
    var hubs: [Hub] = []
    var hubSerializer = HubSerializer()
    
    init() {
        refreshData()
    }
    
    func refreshData() {
        hubs = hubSerializer.getStoredHubs()
    }
    
    func didUpdateHubs(_ hubs: [Hub]) {
        refreshData()
    }
    
    // collection functions
    func sectionCount() -> Int {
        return 1
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return hubs.count
    }
    
    func cellViewModel(_ indexPath: IndexPath) -> HubListCellViewModel? {
        guard indexPath.row < hubs.count else {
            return nil
        }
        
        return HubListCellViewModel.init(hub: hubs[indexPath.row])
    }
    
    // view model vending
    func newHubViewModel() -> NewHubViewModel {
        let vm = NewHubViewModel.init(hubProvider: hubSerializer)
        vm.delegate = self
        return vm
    }
    
    func deviceListViewModel(indexPath: IndexPath) -> DeviceListViewModel {
        return DeviceListViewModel.init(hub: hubs[indexPath.row])
    }
}


