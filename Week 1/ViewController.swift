//
//  ViewController.swift
//  Week 1
//
//  Created by Claudia Yang on 8/26/19.
//  Copyright © 2019 Claudia Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
      messageLabel.text = "You Are Awesome!"
    }
}

