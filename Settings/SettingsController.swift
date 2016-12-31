//
//  SettingsController.swift
//  Settings
//
//  Created by Chandi Abey  on 8/22/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation
import UIKit

class SettingsController {
    
    
    
    //we are going to call this function in our cellForRowAtIndexPath so we need an initializer for the settingscontroller so when we call it we can create so we need to create a singleton, one instance
    
    //singleton
    static let sharedController = SettingsController()
    
    
    //also create a variable of empty array of type setting
    var settings: [Setting] = [ ]
    
    init() {
        settings = mockSettings()
    }
    
    //CRUD methods- create, read, update, delete
    
    //create a function that gives mock data settings populate, function
    //function that returns an array of the setting object 
    func mockSettings() -> [Setting] {
        //create these objects using the initializer we set up. two initializers because we set the initial, use the setting named for UIImage
        let music = Setting(name: "Music", image: UIImage(named: "music"))
        let books = Setting(name: "Books", image: UIImage(named: "books"))
        let apps = Setting(name: "Apps", image: UIImage(named: "apps"))
    
    //return an array of type setting
    return [music, books, apps]
    }

    
    func settingChanged(_ setting: Setting, selected: Bool) {
        //access the isSet property and access the boolean value we are passing in. now go back to settings view controller
        setting.isSet = selected
        
    }
    
}
