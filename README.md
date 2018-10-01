# DevicePpi

This library provides run-time detection of the PPI (pixels per inch) resolution of the main display of an iOS device.

It is useful for applications that display content in true size, for example:

- [3-in-1 Ruler](https://itunes.apple.com/us/app/3-in-1-ruler/id1262452961?mt=8) uses it to display an on-screen ruler.
- [Print to Size](https://itunes.apple.com/us/app/print-to-size/id949490225?mt=8) uses it for its zoom feature, which shows a 1:1 indicator when the document is displayed in true size.

## Example

As Apple releases new iOS devices this library needs to be continously updated to add new devices to its built-in list. It is unable to provide a correct PPI value for new devices that it does not yet know, but in such cases it provides a "best guess" PPI and an error code which you can treat as a non-fatal error.

```swift
let ppi: Double = {
    switch Ppi.get() {
    case .success(let ppi):
        return ppi
    case .unknown(let bestGuessPpi, let error):
        // A bestGuessPpi value is provided but may be incorrect
        // Treat as a non-fatal error -- e.g. send error to Crashlytics and/or display a message
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

## Author

Sébastien Molines

## License

DevicePpi is available under the MIT license. See the LICENSE file for more info.

