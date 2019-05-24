# SwitcherKit
Elegant switching between platform, OS or anything else.

### Description
SwitcherKit is a way or writing elegantly different pathways inside your App/s by replacing those #if #else switches with Rx style closures.

## Features
- [x] Any type pathway switch
- [x] Closures pathway switch
- [x] Built-in pathway switches for common scenarios
-- Platform
-- OS
-- Screen sizes
-- Build configurations
-- Environments
- [x] Build your own pathway switches


## Requirements
- Swift 4.2

## Installation
#### Swift 4.2
```ruby
pod 'http://github.com/victormarcias/SwitcherKit'
```


## Usage

### Switch a value
```swift

let switchableVar = iOSVersionSwitchable<Int>(1)
    .iOS_8(8)
    .iOS_9(9)
    .iOS_10(10)
    .iOS_11(11)
    .iOS_12(12)
    
print(switchableVar.value) // prints the number of the iOS version
```

### Switch with closures
```swift

iOSVersionSwitch {
    print("This is not iOS 12")
}.iOS_12 {
    print("This is iOS 12")
}.execute()

```

### Switch between Debug and Release
```swift

ConfigurationSwitch(debug: {
    // this is DEBUG
}, release: {
    // this is RELEASE
}).execute()

```

### Add a custom condition to an existing Switch

```swift

iOSVersionSwitch {
    print("Default iOS version")
}.custom {
    // This is iOS 22
    if #available(iOS 23, *) { return false }
    if #available(iOS 22, *) { return true }
    return false
}.execute()

```

### Add your own Switch

```swift

public class MyFeatureSwitchable<T>: BaseSwitchable<T> {

    // just implement switchValue on each method
    
    public func featureA(_ value: T) -> Self {
        return switchValue(for: value) {
            return featureA.isEnabled
        }
    }
    
    public func featureB(_ value: T) -> Self {
        return switchValue(for: value) {
            return featureA.isEnabled
        }
    }
}

// Result

let feature = MyFeatureSwitchable<FeatureModule>(NoFeature())
    .featureA(FeatureA())
    .featureB(FeatureB())
    .value

// For closures just implement this:

class MyFeatureSwitch: MyFeatureSwitchable<()->Void> {}

```
