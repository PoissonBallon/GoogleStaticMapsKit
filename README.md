<h3 align="center">
<a href="https://github.com/PoissonBallon/GoogleStaticMapsKit">
<img src="Assets/logo.png" width="200" />
<br />
</a>
GoogleStaticMapsKit
</h3>

------

[![Version](https://img.shields.io/cocoapods/v/GoogleStaticMapsKit.svg?style=flat)](http://cocoapods.org/pods/GoogleStaticMapsKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/GoogleStaticMapsKit.svg?style=flat)](http://cocoapods.org/pods/GoogleStaticMapsKit)
<!-- [![Build Status](https://travis-ci.org/PoissonBallon/GoogleStaticMapsKit.svg?branch=master)](https://travis-ci.org/PoissonBallon/GoogleStaticMapsKit) -->
[![Swift 4](https://img.shields.io/badge/Language-Swift%204-orange.svg)](https://developer.apple.com/swift/)
<!-- [![Coverage Status](https://coveralls.io/repos/github/PoissonBallon/GoogleStaticMapsKit/badge.svg?branch=master)](https://coveralls.io/github/PoissonBallon/GoogleStaticMapsKit?branch=master) -->
[![License](https://img.shields.io/cocoapods/l/GoogleStaticMapsKit.svg?style=flat)](http://cocoapods.org/pods/GoogleStaticMapsKit)

GoogleStaticMapsKit provides a full, lightweight swift API for dealing with Google Static Maps API.

## Preview

<img src="Assets/record.gif" alt="record" width="300"/>

### Zoom

<table border="1" cellpadding="5">

<tr>

<td align="center" valign="center">
<img src="Assets/example/zoom-world.png" alt="zoom-world" width="200"/>
<br />
Zoom : .world
</td>

<td align="center" valign="center">
<img src="Assets/example/zoom-continant.png" alt="zoom-continant" width="200"/>
<br />
Zoom : .continant
</td>

<td align="center" valign="center">
<img src="Assets/example/zoom-city.png" alt="zoom-city" width="200"/>
<br />
Zoom : .city
</td>

<td align="center" valign="center">
<img src="Assets/example/zoom-street.png" alt="zoom-street" width="200"/>
<br />
Zoom : .street
</td>

<td align="center" valign="center">
<img src="Assets/example/zoom-building.png" alt="zoom-building" width="200"/>
<br />
Zoom : .building
</td>

</tr>

</table>


### Style

<table border="1" cellpadding="5">

<tr>

<td align="center" valign="center">
<img src="Assets/example/style-retro.png" alt="style-retro" width="200"/>
<br />
  <a href="https://snazzymaps.com/style/18/retro">Style : [Retro]</a>
</td>

<td align="center" valign="center">
<img src="Assets/example/style-assasins-creed.png" alt="style-assasins" width="200"/>
<br />
  <a href="https://snazzymaps.com/style/72543/assassins-creed-iv">Style : [Assassin's Creed IV]</a>
</td>

<td align="center" valign="center">
<img src="Assets/example/style-lost-in-the-desert.png" alt="style-lost-in-the-desert" width="200"/>
<br />
  <a href="https://snazzymaps.com/style/93/lost-in-the-desert">Style : [Lost in the desert]</a>
</td>

<td align="center" valign="center">
<img src="Assets/example/style-wy.png" alt="style-wy" width="200"/>
<br />
  <a href="https://snazzymaps.com/style/8097/wy">Style : [WY]</a>
</td>

</tr>

</table>

## Getting Started

### Example

```swift
// Setting up the API Key (probably in AppDelegate)
GoogleStaticMaps.setAPIKey(apiKey: "your_api_key")


let parameters = Parameters(size: ImageSize(width: 600, height: 400))
let location = Location(center: .geo(latitude: 45.7772, longitude: 3.0870), zoom: .city)
let gsm = GoogleStaticMaps(location: location, parameters: parameters)

let url = gsm.toURL

print("Result : \(url)")
```

## Style

GoogleStaticMapKit was designed to support JSON Style like [SnazzyMaps](https://snazzymaps.com/)

```swift
[...]
let path = jsonFilePath
let styles = StylesImporter.fromJson(path: path).styles
let feature = Feature(styles: styles)
let gsm = GoogleStaticMaps(location: location, parameters: parameters, feature: feature)

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
