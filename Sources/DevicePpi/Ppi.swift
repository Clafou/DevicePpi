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
        guard let match = machineNameToPpi[machineName] else {
            throw LookUpError.unknownMachineName(machineName)
        }
        return match
    }
    
    static func guess(idiom: UIUserInterfaceIdiom, screen: UIScreen) -> Double {
        if idiom == .pad {
            return screen.scale == 2 ? 264 : 132
        }
        if screen.scale == 3 {
            return screen.nativeScale == 3 ? 460 : 401
        }
        return 326
    }
}
