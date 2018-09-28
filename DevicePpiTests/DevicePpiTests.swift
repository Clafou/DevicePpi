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
        let o = DevicePpi(machineName: "iPhone11,2")
        XCTAssertEqual(o.ppi, 458)
        XCTAssertNil(o.error)
    }

    func testiPad() {
        let o = DevicePpi(machineName: "iPad7,3")
        XCTAssertEqual(o.ppi, 264)
        XCTAssertNil(o.error)
    }

    func testUnkownName() {
        let o = DevicePpi(machineName: "DoesNotExist")
        XCTAssertEqual(o.ppi, 326)
        XCTAssertNotNil(o.error)
    }
    
    func testUnknownRetinaIPad() {
        let ppi = DevicePpi.guessPpi(idiom: .pad, screen: MockScreen(scale: 2, nativeScale: 2))
        XCTAssertEqual(ppi, 264)
    }
    
    func testUnkownSuperRetinaIPhone() {
        let ppi = DevicePpi.guessPpi(idiom: .phone, screen: MockScreen(scale: 3, nativeScale: 3))
        XCTAssertEqual(ppi, 458)
    }
    
    func testUnknownRetinaIPhone() {
        let ppi = DevicePpi.guessPpi(idiom: .phone, screen: MockScreen(scale: 2, nativeScale: 2))
        XCTAssertEqual(ppi, 326)
    }
    
    func testUnknownNonRetinaIPad() {
        let ppi = DevicePpi.guessPpi(idiom: .pad, screen: MockScreen(scale: 1, nativeScale: 1))
        XCTAssertEqual(ppi, 132)
    }


}

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
