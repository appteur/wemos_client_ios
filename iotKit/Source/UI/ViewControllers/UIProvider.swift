//
//  UIProvider.swift
//  iotKit
//
//  Created by Seth on 12/31/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import UIKit

enum UIProvider {
    case newHubVC
    case deviceListVC
    
    var name: String {
        switch self {
        case .newHubVC:
            return "NewHubViewController"
        case .deviceListVC:
            return "DeviceListViewController"
        }
    }
    
    var storyboard: String {
        return "Main"
    }
    
    func controller() -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyboard, bundle: Bundle(for: AppDelegate.self))
        return storyboard.instantiateViewController(withIdentifier: self.name)
    }
}
