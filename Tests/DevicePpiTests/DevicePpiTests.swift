//
//  DevicePpiTests.swift
//  DevicePpiTests
//
//  Created by Sébastien Molines on 28/09/2018.
//  Copyright © 2018 Sébastien Molines. All rights reserved.
//

import XCTest
@testable import DevicePpi

class DevicePpiTests: XCTestCase {

    func testiPhoneXS() {
        XCTAssertEqual(try! Ppi.lookUp(machineName: "iPhone11,2"), 458)
    }

    func testiPad() {
        XCTAssertEqual(try! Ppi.lookUp(machineName: "iPad7,3"), 264)
    }

    func testUnkownName() {
        XCTAssertThrowsError(try Ppi.lookUp(machineName: "DoesNotExist"))
    }
    
    #if canImport(UIKit)
    func testUnknownRetinaIPad() {
        let ppi = Ppi.guess(idiom: .pad, screen: MockScreen(scale: 2, nativeScale: 2))
        XCTAssertEqual(ppi, 264)
    }
    
    func testUnkownSuperRetinaIPhone() {
        let ppi = Ppi.guess(idiom: .phone, screen: MockScreen(scale: 3, nativeScale: 3))
        XCTAssertEqual(ppi, 460)
    }
    
    func testUnknownRetinaIPhone() {
        let ppi = Ppi.guess(idiom: .phone, screen: MockScreen(scale: 2, nativeScale: 2))
        XCTAssertEqual(ppi, 326)
    }
    
    func testUnknownNonRetinaIPad() {
        let ppi = Ppi.guess(idiom: .pad, screen: MockScreen(scale: 1, nativeScale: 1))
        XCTAssertEqual(ppi, 132)
    }
    #endif
    
    #if canImport(AppKit)
    func testMac() {
        XCTAssertNotEqual(Ppi.screenPpi(screen: NSScreen.main), 72)
    }
    #endif
}

#if canImport(UIKit)
class MockScreen: UIScreen {
    
    let _scale: CGFloat
    let _nativeScale: CGFloat
    
    init(scale: CGFloat, nativeScale: CGFloat) {
        _scale = scale
        _nativeScale = nativeScale
        super.init()
    }
    
    override var scale: CGFloat {
        get {
            return _scale
        }
    }

    override var nativeScale: CGFloat {
        get {
            return _nativeScale
        }
    }
}
#endif
