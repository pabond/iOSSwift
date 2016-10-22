//
//  ViewController.swift
//  SwiftTasks
//
//  Created by Bondar Pavel on 10/22/16.
//  Copyright © 2016 Pavel Bondar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var RoundedView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.RoundedView.roundedViewWithShadowing()
    }
}
