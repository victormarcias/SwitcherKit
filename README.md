# SwitcherKit
Elegant switching between platform, OS or anything else.

### Description
SwitcherKit is a way or writing elegantly different pathways inside your App/s by replacing those #if #else switches with Rx style closures.

## Features
- [x] Any type pathway switch
- [x] Closures pathway switch
- [x] Built-in pathway switches for common scenarios:
- Platform
- OS
- Screen sizes
- Build configurations
- Environments
- [x] Build your own pathway switches


## Requirements
- Swift 4.2

## Installation
#### Swift 4.2
```ruby
pod 'SwitcherKit', :git => 'https://github.com/victormarcias/SwitcherKit.git', :tag => 'master'
```


## Usage

### Switchable value example
```swift

let switchableVar = iOSVersionSwitchable<Int>(1)
    .iOS_8(8)
    .iOS_9(9)
    .iOS_10(10)
    .iOS_11(11)
    .iOS_12(12)
    
print(switchableVar.value) // prints the number of the iOS version
```

### Closure example
```swift

iOSVersionSwitch {
    print("This is not iOS 12")
}.iOS_12 {
    print("This is iOS 12")
}.execute()
```

```swift

iOSDeviceSwitch {
    // do this on iPhone
}.iPad {
    // do this on iPad
}.execute()
```

### Debug and Release
```swift

ConfigurationSwitch(debug: {
    // this is DEBUG
}, release: {
    // this is RELEASE
}).execute()
```

### Screen size example
```swift

let image = iPadScreenSwitch<UIImage>(SomeImage())
    .inches_12(SomeiPadProImage())
    .value
```

```swift

iPadScreenSwitch {
    image = SomeImage()
}.inches_12 {
    image = SomeiPadProImage()
}.execute()
```

### Add your own A/B Switch

```swift

public class MyFeatureSwitchable<T>: BaseSwitchable<T> {

    // just implement switchValue on each method and return Self
    
    public func featureA(_ value: T) -> Self {
        return switchValue(for: value) {
            return MyFeatureA.isOn
        }
    }
    
    public func featureB(_ value: T) -> Self {
        return switchValue(for: value) {
            return !MyFeatureA.isOn
        }
    }
}

// Result

let featureView = MyFeatureSwitchable<ABFeatureView>(NoFeatureView())
    .featureA(FeatureAView())
    .featureB(FeatureBView())
    .value
```

```swift

// For closures just implement this:

class MyFeatureSwitch: MyFeatureSwitchable<()->Void> {}

// Result

MyFeatureSwitch {
    // use FeatureA view
}.featureB {
    // use FeatureB view
}.execute()

// or...

MyFeatureSwitch {
    // don't use Feature
}.featureA {
    // use FeatureA stuff
}.featureB {
    // use FeatureB stuff
}.execute()
```
