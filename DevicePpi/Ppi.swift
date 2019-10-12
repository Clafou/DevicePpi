//
//  DevicePpi.swift
//
//  Created by Sébastien Molines on 28/09/2018.
//

import UIKit

public enum Ppi {
    
    public enum GetPpiResult {
        case success(ppi: Double)
        case unknown(bestGuessPpi: Double, error: Error)
    }
    
    /// Determines the PPI of the device's display.
    /// When successful (the device is known), provides the PPI value.
    /// When not successful (the device is not recognised), provides a guessed PPI value and a non-fatal error
    /// that you can log to Crashlytics or other to track new device models that need to be added to the list.
    public static func get() -> GetPpiResult
    {
        do {
            let ppi = try Ppi.lookUp(machineName: SysInfo.machineName ?? "n/a")
            return .success(ppi: ppi)
        }
        catch {
            let ppi = Ppi.guess(idiom: UIDevice.current.userInterfaceIdiom, screen: UIScreen.main)
            return .unknown(bestGuessPpi: ppi, error: error)
        }
    }
}

extension Ppi {
    
    enum LookUpError: Error {
        case unknownMachineName(String)
    }
    
    static func lookUp(machineName: String) throws -> Double {
        guard let match = machineNamesToPpi.first(where: { $0.machineNames.contains(machineName) }) else {
            throw LookUpError.unknownMachineName(machineName)
        }
        return match.ppi
    }
    
    static func guess(idiom: UIUserInterfaceIdiom, screen: UIScreen) -> Double {
        if idiom == .pad {
            return screen.scale == 2 ? 264 : 132
        }
        if screen.scale == 3 {
            return screen.nativeScale == 3 ? 458 : 401
        }
        return 326
    }
    
    private static var machineNamesToPpi: [(machineNames: [String], ppi: Double)] = [
        (
            [
                // iPhone 11 Pro
                "iPhone12,3",
                // iPhone 11 Pro Max
                "iPhone12,5",
                // iPhone XS
                "iPhone11,2",
                // iPhone XS Max
                "iPhone11,4", "iPhone11,6",
                // iPhone X
                "iPhone10,3", "iPhone10,6"
            ],
            458
        ),
        (
            [
                // iPhone 8 Plus
                "iPhone10,2", "iPhone10,5",
                // iPhone 7 Plus
                "iPhone9,2", "iPhone9,4",
                // iPhone 6S Plus
                "iPhone8,2",
                // iPhone 6 Plus
                "iPhone7,1"
            ],
            401
        ),
        (
            [
                // iPhone 11
                "iPhone12,1",
                // iPhone XR
                "iPhone11,8",

                // iPhone 8
                "iPhone10,1", "iPhone10,4",
                // iPhone 7
                "iPhone9,1", "iPhone9,3",
                // iPhone 6S
                "iPhone8,1",
                // iPhone 6
                "iPhone7,2",
                
                // iPhone SE
                "iPhone8,4",
                // iPhone 5S
                "iPhone6,1", "iPhone6,2",
                // iPhone 5C
                "iPhone5,3", "iPhone5,4",
                // iPhone 5
                "iPhone5,1", "iPhone5,2",
                // iPod Touch (6th generation)
                "iPod7,1",
                // iPod Touch (5th generation)
                "iPod5,1",
                
                // iPhone 4S
                "iPhone4,1",

                // iPad Mini (5th generation)
                "iPad11,1", "iPad11,2",
                // iPad Mini 4
                "iPad5,1", "iPad5,2",
                // iPad Mini 3
                "iPad4,7", "iPad4,8", "iPad4,9",
                // iPad Mini 2
                "iPad4,4", "iPad4,5", "iPad4,6"
            ],
            326
        ),
        (
            [
                // iPad (7th generation)
                "iPad7,11", "iPad7,12",
                // iPad Air (3rd generation)
                "iPad11,3", "iPad11,4",
                // iPad Pro (12.9″, 3rd generation)
                "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8",
                // iPad Pro (11″)
                "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4",
                // iPad (6th generation)
                "iPad7,5", "iPad7,6",
                // iPad Pro (10.5″)
                "iPad7,3", "iPad7,4",
                // iPad Pro (12.9″, 2nd generation)
                "iPad7,1", "iPad7,2",
                // iPad (5th generation)
                "iPad6,11", "iPad6,12",
                // iPad Pro (12.9″)
                "iPad6,7", "iPad6,8",
                // iPad Pro (9.7″)
                "iPad6,3", "iPad6,4",
                // iPad Air 2
                "iPad5,3", "iPad5,4",
                // iPad Air
                "iPad4,1", "iPad4,2", "iPad4,3",
                // iPad (4th generation)
                "iPad3,4", "iPad3,5", "iPad3,6",
                // iPad (3rd generation)
                "iPad3,1", "iPad3,2", "iPad3,3"
            ],
            264
        ),
        (
            [
                // iPad Mini
                "iPad2,5", "iPad2,6", "iPad2,7"
            ],
            163
        ),
        (
            [
                // iPad 2
                "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"
            ],
            132
        )
    ]
}
