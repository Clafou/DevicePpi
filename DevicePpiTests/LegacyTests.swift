//
//  LegacyTests.swift
//  DevicePpiTests
//
//  Created by Sébastien Molines on 28/09/2018.
//  Copyright © 2018 Sébastien Molines. All rights reserved.
//

import XCTest
@testable import DevicePpi

class LegacyTests: XCTestCase {

    func testMatchingLegacy() {
        for knownDevice in KnownDevices.all {
            print(knownDevice)
            for machineName in knownDevice.machineNames {
                print(machineName)
                let result = DevicePpi(machineName: machineName)
                XCTAssertNil(result.error)
                XCTAssertEqual(result.ppi, knownDevice.ppi, "Mismatch: \(machineName)")
            }
        }
    }
}
