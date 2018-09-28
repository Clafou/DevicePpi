//
//  KnownDevices.swift
//  Ruler
//
//  Created by Sébastien Molines on 17/12/2015.
//  Copyright © 2015 Clafou Apps. All rights reserved.
//

import UIKit

class KnownDevices {
    
    enum Error: Swift.Error {
        case unknownMachineName(String)
    }
    
    static let all = [

        // 3.5-inch
        KnownDevice(displayName: "iPhone 4", machineNames: ["iPhone3,1", "iPhone3,3"], ppi: 326),

        // 4-inch
        KnownDevice(displayName: "iPod Touch 5", machineNames: ["iPod5,1"], ppi: 326),
        KnownDevice(displayName: "iPod Touch 6", machineNames: ["iPod7,1"], ppi: 326),
        KnownDevice(displayName: "iPhone 5", machineNames: ["iPhone5,1", "iPhone5,2"], ppi: 326),
        KnownDevice(displayName: "iPhone 5c", machineNames: ["iPhone5,3", "iPhone5,4"], ppi: 326),
        KnownDevice(displayName: "iPhone 5s", machineNames: ["iPhone6,1", "iPhone6,2"], ppi: 326),
        KnownDevice(displayName: "iPhone SE", machineNames: ["iPhone8,4"], ppi: 326),

        // 4.7-inch
        KnownDevice(displayName: "iPhone 6", machineNames: ["iPhone7,2"], ppi: 326),
        KnownDevice(displayName: "iPhone 6s", machineNames: ["iPhone8,1"], ppi: 326),
        KnownDevice(displayName: "iPhone 7", machineNames: ["iPhone9,1", "iPhone9,3"], ppi: 326),
        KnownDevice(displayName: "iPhone 8", machineNames: ["iPhone10,1", "iPhone10,4"], ppi: 326),

        // 5.5-inch
        KnownDevice(displayName: "iPhone 6 Plus", machineNames: ["iPhone7,1"], ppi: 401),
        KnownDevice(displayName: "iPhone 6s Plus", machineNames: ["iPhone8,2"], ppi: 401),
        KnownDevice(displayName: "iPhone 7 Plus", machineNames: ["iPhone9,2", "iPhone9,4"], ppi: 401),
        KnownDevice(displayName: "iPhone 8 Plus", machineNames: ["iPhone10,2", "iPhone10,5"], ppi: 401),

        // iPhone X & XS
        KnownDevice(displayName: "iPhone X", machineNames: ["iPhone10,3", "iPhone10,6"], ppi: 458),
        KnownDevice(displayName: "iPhone XS", machineNames: ["iPhone11,2"], ppi: 458),
        
        // iPhone XS Max
        KnownDevice(displayName: "iPhone XS Max", machineNames: ["iPhone11,4", "iPhone11,6"], ppi: 458),

        // iPhone XR
        KnownDevice(displayName: "iPhone XR", machineNames: ["iPhone11,8"], ppi: 326),

        // iPad mini
        KnownDevice(displayName: "iPad mini", machineNames: ["iPad2,5", "iPad2,6", "iPad2,7"], ppi: 163),

        // iPad mini retina
        KnownDevice(displayName: "iPad mini 2", machineNames: ["iPad4,4", "iPad4,5", "iPad4,6"], ppi: 326),
        KnownDevice(displayName: "iPad mini 3", machineNames: ["iPad4,7", "iPad4,8", "iPad4,9"], ppi: 326),
        KnownDevice(displayName: "iPad mini 4", machineNames: ["iPad5,1", "iPad5,2"], ppi: 326),

        // iPad
        KnownDevice(displayName: "iPad 2", machineNames: ["iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"], ppi: 132),

        // iPad retina
        KnownDevice(displayName: "iPad 3", machineNames: ["iPad3,1", "iPad3,2", "iPad3,3"], ppi: 264),
        KnownDevice(displayName: "iPad 4", machineNames: ["iPad3,4", "iPad3,5", "iPad3,6"], ppi: 264),
        KnownDevice(displayName: "iPad Air", machineNames: ["iPad4,1", "iPad4,2", "iPad4,3"], ppi: 264),
        KnownDevice(displayName: "iPad Air 2", machineNames: ["iPad5,3", "iPad5,4"], ppi: 264),
        KnownDevice(displayName: "iPad Pro 9.7″", machineNames: ["iPad6,3", "iPad6,4"], ppi: 264),
        KnownDevice(displayName: "iPad (5th Generation)″", machineNames: ["iPad6,11", "iPad6,12"], ppi: 264),
        KnownDevice(displayName: "iPad (6th Generation)″", machineNames: ["iPad7,5", "iPad7,6"], ppi: 264),

        // iPad 10.5"
        KnownDevice(displayName: "iPad Pro 10.5″", machineNames: ["iPad7,3", "iPad7,4"], ppi: 264),

        // iPad 12.9"
        KnownDevice(displayName: "iPad Pro 12.9″", machineNames: ["iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2"], ppi: 264),

        // iOS Simulator
        //KnownDevice(displayName: "Simulator", machineNames: ["x86_64"], ppi: 100),
    ]
    
    static let dictionary: [String:KnownDevice] = {
        var dictionary = [String:KnownDevice]()
        for knownDevice in KnownDevices.all {
            for machineName in knownDevice.machineNames {
                dictionary[machineName] = knownDevice
            }
        }
        return dictionary
    }()
    
    static let current = KnownDevices.getCurrent()
    
    fileprivate static func getCurrent() -> KnownDevice? {
        let machineName = UIDevice.current.machine
        if let match = dictionary[machineName] {
            return match
        }
        if machineName != "x86_64" {    // iOS Simulator, not a physical device
            //Error.unknownMachineName(machineName).log()
        }
        return nil
    }
    
    static var dummy: KnownDevice = {
        if UIDevice.current.machine.contains("iPad") {
            return KnownDevice(displayName: "Unknown iPad", machineNames: [UIDevice.current.machine], ppi: 264)
        }
        if UIScreen.main.scale == 3 {
            if UIScreen.main.nativeScale == 3 {
                return KnownDevice(displayName: "Unkown iPhone", machineNames: [UIDevice.current.machine], ppi: 458)
            }
            return KnownDevice(displayName: "Unknown iPhone", machineNames: [UIDevice.current.machine], ppi: 401)
        }
        return KnownDevice(displayName: "Unknown iPhone", machineNames: [UIDevice.current.machine], ppi: 326)
    }()
}
