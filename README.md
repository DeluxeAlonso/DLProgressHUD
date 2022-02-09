# DLProgressHUD

[![CI Status](https://img.shields.io/travis/DeluxeAlonso/DLProgressHUD.svg?style=flat)](https://travis-ci.org/DeluxeAlonso/DLProgressHUD)
[![Version](https://img.shields.io/cocoapods/v/DLProgressHUD.svg?style=flat)](https://cocoapods.org/pods/DLProgressHUD)
[![License](https://img.shields.io/cocoapods/l/DLProgressHUD.svg?style=flat)](https://cocoapods.org/pods/DLProgressHUD)
[![Platform](https://img.shields.io/cocoapods/p/DLProgressHUD.svg?style=flat)](https://cocoapods.org/pods/DLProgressHUD)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory beforehand.

## Requirements

DLProgressHUD requires iOS 12.0 and Swift 5.0 or above.

## Installation

DLProgressHUD is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DLProgressHUD'
```

## Usage

There are five modes that can be used to show the progress HUD: loading, loadingWithText, textOnly, image and imageWithText.

You just need to call the show method and pass the mode as a parameter:

```swift
DLProgressHUD.show(.loading)
```

## Appearance and presentation configuration

There are two ways to configure the appearance and presentation of `DLAutoSlidePageViewController`:

1) You can do it globally using the `DefaultHudConfiguration` class before instantiation.

```swift
DLProgressHUD.defaultConfiguration.backgroundInteractionEnabled = true
DLProgressHUD.show(.loading)
```

2) You can create your own configuration instance that conforms to `HudConfigurationProtocol` protocol and pass it on `DLProgressHUD`'s methods.

```swift
struct HudCustomConfiguration: HudConfigurationProtocol {
    var hudContentPreferredHeight: CGFloat = 64
    var hudContentPreferredWidth: CGFloat = 180
    var textFont: UIFont = .systemFont(ofSize: 18.0)
}
```

```swift
let configuration = HudTextOnlyConfiguration()
DLProgressHUD.show(.textOnly("Loading..."), configuration: configuration)
```

## Author

DeluxeAlonso, alonso.alvarez.dev@gmail.com

## License

DLProgressHUD is available under the MIT license. See the LICENSE file for more info.
