//
//  NewHubViewController.swift
//  iotKit
//
//  Created by Seth on 12/31/17.
//  Copyright © 2017 Seth. All rights reserved.
//

import UIKit

class NewHubViewController: UIViewController {

    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_ip: UITextField!
    @IBOutlet weak var tf_scheme: UITextField!
    @IBOutlet weak var tf_description: UITextField!
    
    @IBOutlet weak var button_done: UIButton!
    
    var viewModel: NewHubViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func actionDone(_ sender: Any) {
        
        // save
        guard viewModel.saveHub(name: tf_name.text, domain: tf_ip.text, scheme: tf_scheme.text, description: tf_description.text) == true else {
            // TODO: show error alert here
            return
        }
        
        // dismiss controller
        navigationController?.popViewController(animated: true)
    }
    
}
