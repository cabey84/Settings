//
//  SettingsViewController.swift
//  Settings
//
//  Created by Chandi Abey  on 8/22/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

//use an extension for organizational purposes, classes that Xcode has already set up. can create all sorts of custom functions that xcode and apple have developed. subclass this as data source and view delegate
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //access singleton, then array, and the settings which accesses the function mockSettings (b/c of the intitializer we used) this last part is new.
        return SettingsController.sharedController.settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a cell to say this is the cell we are giong to use we made a table view inside  a viewcontroller the deque is not there. setttingsTableView is coming from the outlet we linked above.
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell
        //since we made a custom cell, we need to tell which custom cell we used, indexpath.row is how we access something from the setting
        let setting = SettingsController.sharedController.settings[indexPath.row]
        
        //Configure cell- update cell settings later. since we created a custom cell, create a function that allows all of the properties to be updated and then we will call it here in the cell for row index path. SO go back to settingstableviewcell. This is what calls the method.  
        cell?.updateCellWithSetting(setting)
        cell?.delegate = self
        //we need to unwrap our cell b/c settingTableView cell is uwnrapped. use a nil coalescent to unwrap it. return cell or just empty cell of the type we want.
        return cell ?? SettingTableViewCell()
    }
        
        
        
}
    
    //we created an extension that we want to conform to this delegate, just like above, except this time it is with the one we created
    
    
extension SettingsViewController: SettingCellDelegate {
        func settingSwitchValueChanged(_ cell: SettingTableViewCell, selected: Bool) {                                                                                                                                                                                             
            //so we want to say what we want to happen when this happens, use guard to unwrap optionals
            guard let setting = cell.setting,
                let indexPath = settingsTableView.indexPath(for: cell) else { return }
            
            //create a function that calls the boolean value . righ tnow we have a value of default false. thats why the color wasnt changing. so we need to tell int to change the value. so create a function in our settings controller that is saying hey this settin gchanged. 
            settingsTableView.beginUpdates()
            SettingsController.sharedController.settingChanged(setting, selected: selected)
            settingsTableView.reloadRows(at: [indexPath], with: .automatic)
            settingsTableView.endUpdates()
        }
    }
    
