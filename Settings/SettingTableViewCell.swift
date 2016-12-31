//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Chandi Abey  on 8/22/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    //STEP 1 create IB Outlets and IB Actions

    @IBOutlet weak var settingImageView: UIImageView!
    
    
    @IBOutlet weak var settingLabel: UILabel!
    
    
    @IBOutlet weak var settingSwitch: UISwitch!
    
    //strong references always hold a place in memory. weak reference will only pull a place in memory when its used. it wont allocate to that variable.
    
    //STEP 2: Create delegate
    weak var delegate: SettingCellDelegate?
    
    //STEP 3: setting variable
    
    var setting: Setting?
    
    //STEP 4: function we will use to set the properties on our cells. which will be called in cellforrowatindexpath
    func updateCellWithSetting(_ setting: Setting) {
        //create a vraible of type setting so that wheatever setting we pass in will equal the setting variable in here
        self.setting = setting
        settingImageView.image = setting.image
        settingLabel.text = setting.name
        //boolean value on determines on / off
        settingSwitch.isOn = setting.isSet
        
        if setting.isSet {
            //default is true  when we use if statements with boolean values. if we wanted to declare it is falase 
            self.backgroundColor = UIColor.cyan
        } else {
            self.backgroundColor = UIColor.white
        }
            
        
    }
    
    
    //MARK- Actions
    
    @IBAction func switchValueChanged(_ sender: AnyObject) {
        //cell is going to be self and selected is settingSwithc.on when the action happens its going to go to our delegate, call theis function and pass in this cell and the boolean value is what we will get, when this is called which classes are conforming to this delegate, so its going to call the function there. so in settingsviewcontroller is where it is being called and then runs through the code and says we need the stuff we're passing on, we are passign in self, class and boolean value, so it has that cell SEttingttablevviewcell . then go to our sharedconroller instance and the settingChanged function and siwthc hte value to whatever the Bool value that was selected. then its going to reload the rows at index path in that extension so when you run through it changes color. 
        //loading the cell with stuff that it dneeds in the SettingsViewController, going to find out what the delegate is, and this viewcongrolelr is handling the delegate cell.delegate? = self , what is the setting switch and comes back and knows what the setting swtich is. and who is conforming to this protocol. which classes? so it has the settingsviewcotnroller and it brings in the information  which passed in self and Bool value . then calls the settingchanged function 
        delegate?.settingSwitchValueChanged(self, selected: settingSwitch.isOn)
    }

}

//go outside of the class to create a protocol, so table view cell is the delegator. so just creating the fucntion but NOT implementing the function. when do we want this called? inside a function. so first we careate a property weak reference delegate variable, the delegat is going to be the settingcelldelegate that we made.
protocol SettingCellDelegate: class {
    func settingSwitchValueChanged(_ cell: SettingTableViewCell, selected: Bool)
}


    

