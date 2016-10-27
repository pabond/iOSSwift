//
//  ViewController.swift
//  PopoverPresentation
//
//  Created by Bondar Pavel on 10/25/16.
//  Copyright © 2016 Pavel Bondar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    @IBOutlet var navItem: UINavigationBar!
    @IBOutlet var settingsButton: UIBarButtonItem!
    
    @IBAction func onSettings(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "settingsPop", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingsButton.title = NSString(string: "\u{2699}") as String
        if let font = UIFont(name: "Helvetica", size: 18.0) {
            self.settingsButton.setTitleTextAttributes([NSFontAttributeName: font], for: UIControlState.normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "settingsPop" {
            let dest = segue.destination
            
            dest.preferredContentSize = CGSize(width: 100, height: 100)
            
            if let pop = dest.popoverPresentationController {
                pop.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

