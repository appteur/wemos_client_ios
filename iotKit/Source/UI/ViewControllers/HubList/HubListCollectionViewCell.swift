//
//  HubListCollectionViewCell.swift
//  iotKit
//
//  Created by Seth on 12/31/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import UIKit

class HubListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: HubListCellViewModel!
    
    func configure(_ viewModel: HubListCellViewModel) {
        self.viewModel = viewModel
        
        // configure cell properties from view model
        titleLabel.text = viewModel.hub.name
    }
    
}
