# DevicePpi

This library provides run-time detection of the PPI (pixels per inch) resolution of the main display of an iOS device.

It is useful for applications that display content in true size, for example:

- [3-in-1 Ruler](https://itunes.apple.com/us/app/3-in-1-ruler/id1262452961?mt=8) uses it to display an on-screen ruler.
- [Print to Size](https://itunes.apple.com/us/app/print-to-size/id949490225?mt=8) uses it for its zoom feature, which shows a 1:1 indicator when the document is displayed in true size.

## Example

As Apple releases new iOS devices this library needs to be continously updated to add new devices to its built-in list. It cannot guarantee an accurate PPI value for new devices that it does not yet know, but in such cases it provides a "best guess" PPI based on heuristics (`UIUserInterfaceIdiom` and `UIScreen` values) and an error code which you can treat as a non-fatal error.

```swift
let ppi: Double = {
    switch Ppi.get() {
    case .success(let ppi):
        return ppi
    case .unknown(let bestGuessPpi, let error):
        // A bestGuessPpi value is provided but may be incorrect
        // Treat as a non-fatal error -- e.g. log to your backend and/or display a message
        return bestGuessPpi
    }
}()
```

## Requirements

iOS 8 or later.

## Installation

DevicePpi can be added to project via [CocoaPods](https://cocoapods.org).

```ruby
pod 'DevicePpi'
```

## Devices

The list of devices and their PPI is updated as new models are announced. Currently, the following devices are included:

iPhone
* iPhone 4S
* iPhone 5
* iPhone 5C
* iPhone 5S
* iPhone 6
* iPhone 5 Plus
* iPhone 6S
* iPhone SE
* iPhone 7
* iPhone 7 Plus
* iPhone 8
* iPhone 8 Plus
* iPhone X
* iPhone XS
* iPhone XS Max
* iPhone XR
* iPhone 11
* iPhone 11 Pro
* iPhone 11 Pro Max

iPod Touch
* iPod Touch (5th generation)
* iPod Touch (6th generation)

iPad
* iPad 2
* iPad Mini
* iPad (3rd generation)
* iPad (4th generation)
* iPad Air
* iPad Mini 2
* iPad Mini 3
* iPad Air 2
* iPad Mini 4
* iPad Pro (9.7″)
* iPad Pro (12.9″)
* iPad (5th generation)
* iPad Pro (12.9″, 2nd generation)
* iPad Pro (10.5″)
* iPad (6th generation)
* iPad Pro (11″)
* iPad Pro (12.9″, 3rd generation)
* iPad Air (3rd generation)
* iPad Mini (5th generation)
* iPad (7th generation)

Devices that are too old to support iOS 8 or later (this library's deployment target) are not included. These are: iPhone (original model), iPhone 3GS, iPhone 4, and the first, 2nd and 3rd generation of iPod Touch.

## Author

Sébastien Molines

## License

DevicePpi is available under the MIT license. See the LICENSE file for more info.

