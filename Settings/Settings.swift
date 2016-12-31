//
//  File.swift
//  Settings
//
//  Created by Chandi Abey  on 8/22/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//


import UIKit


class Setting {
    
    //what do we need to create this object
    var isSet: Bool
    let name: String
    let image: UIImage?
    
    //giving a default value of false
    init(name: String, image: UIImage?, isSet: Bool = false) {
        self.name = name
        self.image = image
        self.isSet = isSet
    }
    
    
}