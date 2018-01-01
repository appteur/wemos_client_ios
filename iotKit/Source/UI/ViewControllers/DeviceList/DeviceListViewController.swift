//
//  ViewController.swift
//  iotKit
//
//  Created by Seth on 12/30/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import UIKit

class DeviceListViewController: UIViewController {

    let cellID: String = "DeviceListTableCell"
    @IBOutlet weak var tableview: UITableView!
    
    var viewModel: DeviceListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Devices"
        
        // define datasource/delegate for tableview data
        tableview.dataSource = self
        tableview.delegate = self
        
        viewModel?.loadDeviceList { (success) in
            guard success == true else {
                print("Device list request failed...")
                return
            }
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
}

extension DeviceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel!.sectionCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Num Rows: \(viewModel.deviceCount())")
        return viewModel.deviceCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DeviceListTableViewCell
        cell.configure(viewModel.deviceListItemViewModel(for: indexPath))
        return cell
    }
}

