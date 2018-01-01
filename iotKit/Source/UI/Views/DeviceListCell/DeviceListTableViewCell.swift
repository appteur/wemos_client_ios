//
//  DeviceListTableViewCell.swift
//  iotKit
//
//  Created by Seth on 12/30/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import UIKit

class DeviceListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var deviceIdentifier: UILabel!
    @IBOutlet weak var deviceDescription: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    var viewModel: DeviceListCellViewModel?
    
    override func prepareForReuse() {
        deviceName.text = ""
        deviceIdentifier.text = ""
        deviceDescription.text = ""
        
        super.prepareForReuse()
    }

    func configure(_ viewModel: DeviceListCellViewModel?) {
        guard let viewModel = viewModel else {
            return
        }
        
        self.viewModel = viewModel
        
        deviceName.text = viewModel.device.name
        deviceIdentifier.text = viewModel.device.identifier
        deviceDescription.text = viewModel.device.description
        toggleButton.setTitle(viewModel.toggleTitle(), for: .normal)
    }
    
    @IBAction func handleStateChange(_ sender: UIButton) {
        
        // request state change for device
        viewModel?.didUpdateButtonState()
        
        // update button title
        toggleButton.setTitle(viewModel?.toggleTitle(), for: .normal)
    }
    
}
