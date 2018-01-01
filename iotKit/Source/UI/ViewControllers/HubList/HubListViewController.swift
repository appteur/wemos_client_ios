//
//  HubListViewController.swift
//  iotKit
//
//  Created by Seth on 12/31/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import UIKit

class HubListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellID: String = "HubListCell"
    var viewModel = HubListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.refreshData()
        collectionView.reloadData()
        
        super.viewWillAppear(animated)
    }

    @IBAction func actionAddHub(_ sender: Any) {
        guard let vc = UIProvider.newHubVC.controller() as? NewHubViewController else {
            return
        }
        vc.viewModel = viewModel.newHubViewModel()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HubListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sectionCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HubListCollectionViewCell
        
        if let vm = viewModel.cellViewModel(indexPath) {
            cell.configure(vm)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = UIProvider.deviceListVC.controller() as? DeviceListViewController else {
            return
        }
        vc.viewModel = viewModel.deviceListViewModel(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}
