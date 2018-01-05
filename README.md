<h3 align="center">
<a href="https://github.com/PoissonBallon/GoogleStaticMapsKit">
<img src="Assets/logo.png" width="200" />
<br />
</a>
GoogleStaticMapsKit
</h3>

------

<!-- [![Version](https://img.shields.io/cocoapods/v/GoogleStaticMapsKit.svg?style=flat)](http://cocoapods.org/pods/GoogleStaticMapsKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/GoogleStaticMapsKit.svg?style=flat)](http://cocoapods.org/pods/GoogleStaticMapsKit)

[![Build Status](https://travis-ci.org/PoissonBallon/GoogleStaticMapsKit.svg?branch=master)](https://travis-ci.org/PoissonBallon/GoogleStaticMapsKit)
[![Swift 3](https://img.shields.io/badge/Language-Swift%203-orange.svg)](https://developer.apple.com/swift/)
[![Coverage Status](https://coveralls.io/repos/github/PoissonBallon/GoogleStaticMapsKit/badge.svg?branch=master)](https://coveralls.io/github/PoissonBallon/GoogleStaticMapsKit?branch=master)
[![License](https://img.shields.io/cocoapods/l/GoogleStaticMapsKit.svg?style=flat)](http://cocoapods.org/pods/GoogleStaticMapsKit) -->

GoogleStaticMapsKit provides a full swift API for dealing with Google Static Maps API.

## Getting Started

### Example

```swift
// Setting up the API Key (probably in AppDelegate)
GoogleStaticMaps.setAPIKey(apiKey: "your_api_key")

let locationCenter = LocationCenter.geo(latitude: 45.7772, longitude: 3.0870)
let imageSize = ImageSize(width: 200, height: 200)

let point = Location(center: locationCenter, zoom: .city)
let setting = Parameters(size: imageSize)

// Use GoogleStaticMaps Object
let gsm = GoogleStaticMaps(point: point, setting: setting)
let url = gsm.toURL

print("Result : \(url)")
```

## Style

GoogleStaticMapKit was designed to support JSON Style like [SnazzyMaps](https://snazzymaps.com/)

```swift
[...]
let path = jsonFilePath
let styles = StylesImporter.fromJson(path: path).styles

let component = Feature(styles: styles)
let gsm = GoogleStaticMaps(point: point, setting: setting, component: component)
```

For more information about Google Maps Style you can look on the official [Google Documentation](https://developers.google.com/maps/documentation/static-maps/styling)



## Support

* Location parameters
  * [x] Center by coordinates
  * [x] Center by adress
  * [x] Zoom Level
* Map parameters
  * [x] Size
  * [x] Scale
  * [x] Format (png/gif/jpg)
  * [x] Map Type (roadmap / satellite / hybrid / terrain)
  * [x] Language
  * [x] Region
* Feature parameters
  * [x] Markers
  * [ ] Path
  * [ ] Visible
  * [x] Style
* Key and Signature parameters
  * [x] Key
  * [ ] Signature

## Installation

GoogleStaticMapsKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

#### CocoaPods
```ruby
use_frameworks!
pod "GoogleStaticMapsKit"
```

#### Carthage
```ruby
github 'PoissonBallon/GoogleStaticMapsKit'
```


#### Swift Package Manager
```swift
let package = Package(
    name: "MyPackage",
    dependencies: [
        .Package(url: "https://github.com/PoissonBallon/GoogleStaticMapsKit", majorVersion: 1),
    ]
)
```

## Author

* PoissonBallon [@poissonballon](https://twitter.com/poissonballon)

## License

GoogleStaticMapsKit is available under the MIT license. See the LICENSE file for more info.
