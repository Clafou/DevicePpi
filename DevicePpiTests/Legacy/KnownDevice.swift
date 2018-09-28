//
//  KnownDevice.swift
//  Ruler
//
//  Created by Sébastien Molines on 17/12/2015.
//  Copyright © 2015 Clafou Apps. All rights reserved.
//

import Foundation

struct KnownDevice {
    
    /// The model name, such as "iPhone 5"
    let displayName: String
    
    /// The list of candidate machine names that match this known device, such as ["iPhone5,1", "iPhone5,2"]
    let machineNames: [String]
    
    /// The screen resolution in pixels per inch
    let ppi: Double
}
