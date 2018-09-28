//  Adapted from http://stackoverflow.com/questions/26028918/ios-how-to-determine-iphone-model-in-swift/26962452#26962452

import UIKit

public extension UIDevice {
    
    /// Machine identifier, such as "iPhone6,1"
    var machine: String {
        var sysinfo = utsname()
        uname(&sysinfo)
        
        let data = Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN))
        guard let s = String(data: data as Data, encoding: String.Encoding.ascii) else {
            return "Unknown"
        }
        if let terminatorRange = s.range(of: "\0") {
            return String(s[s.startIndex..<terminatorRange.lowerBound])
        }
        return s
    }

/*
    /// Device model, such as "iPhone 6 Plus"
    /// See http://www.everymac.com/ultimate-mac-lookup/
    var modelName: String {
        switch self.machine {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return self.machine
        }
    }
*/
}
