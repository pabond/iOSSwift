//
//  SettingsViewController.swift
//  SwiftTasks
//
//  Created by Bondar Pavel on 10/25/16.
//  Copyright © 2016 Pavel Bondar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var navItem: UINavigationBar!
    @IBOutlet var HeigthConstraint: NSLayoutConstraint!
    @IBOutlet var settingsTableView: UITableView!
    @IBOutlet var activeViewContainer: UIView!
    
    @IBAction func onSettings(_ sender: AnyObject) {
        if (HeigthConstraint.constant == 0) {
            showMenu()
        } else {
            hideMenu()
        }

    }
    
    var viewControllersArr: [UIViewController]  {
        get { // getter returns read only copy
            let immutableCopy = viewControllerArray
            return immutableCopy
        }
        set {
            viewControllerArray = newValue
            
            // set the active view controller to the first one in the new array if the current one is not in there
            if activeViewController == nil || viewControllerArray.index(of:activeViewController!) == nil {
                activeViewController = viewControllerArray.first
            }
        }
    }

    private var viewControllerArray = [UIViewController]()
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if isViewLoaded {
            if let inActiveVC = inactiveViewController {
                inActiveVC.willMove(toParentViewController: nil)
                inActiveVC.view.removeFromSuperview()
                inActiveVC.removeFromParentViewController()
            }
        }
    }
    
    private func updateActiveViewController() {
        if isViewLoaded {
            if let activeVC = activeViewController {
                addChildViewController(activeVC)
                activeVC.view.frame = activeViewContainer.bounds
                activeViewContainer.addSubview(activeVC.view)
                self.title = activeVC.title
                activeVC.didMove(toParentViewController: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        settingsTableView.rowHeight =  50
        // menu is hidden to start
        self.HeigthConstraint.constant = 0
        updateActiveViewController()
    }
    
    private func hideMenu() {
        UIView .animate(withDuration: 0.3, animations: { () -> Void in
            self.HeigthConstraint.constant = 0
            self.settingsTableView.layoutIfNeeded()
        });
    }
    
    private func showMenu() {
        UIView .animate(withDuration: 0.3, animations: { () -> Void in
            let totalHeight = self.settingsTableView.rowHeight * CGFloat(self.settingsTableView.numberOfRows(inSection: 0))
            self.HeigthConstraint.constant = totalHeight
            self.settingsTableView.layoutIfNeeded()
        });
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as UITableViewCell
        cell.textLabel?.text = viewControllerArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        activeViewController = viewControllerArray[indexPath.row]
        hideMenu()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(nibName: "MenuViewController", bundle: nil)
    }
}
