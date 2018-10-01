//
//  SysInfo.swift
//
//  Created by Sébastien Molines on 27/09/2018.
//

import Foundation

public enum SysInfo {
    
    /// Machine identifier such as "iPhone6,1", or nil if it could not be determined
    public static var machineName: String? = {
        
        //  Adapted from http://stackoverflow.com/questions/26028918/ios-how-to-determine-iphone-model-in-swift/26962452#26962452
        var sysinfo = utsname()
        uname(&sysinfo)
        
        let data = Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN))
        guard let s = String(data: data as Data, encoding: String.Encoding.ascii) else {
            return nil
        }
        if let terminatorRange = s.range(of: "\0") {
            return String(s[s.startIndex..<terminatorRange.lowerBound])
        }
        return s
    }()
}
