# watchOS Support

xtool now supports building apps for watchOS 8 and later.

## Overview

With watchOS support, you can now use xtool to build, sign, and deploy watchOS apps just like iOS apps. This includes:

- Building Swift Package Manager projects into watchOS apps
- Signing watchOS apps with your Apple Developer certificate
- Installing watchOS apps to connected devices
- Using SwiftData for data persistence on watchOS (watchOS 8+)

## Getting Started

To create a new watchOS app with xtool, you can use the same `xtool new` command:

```bash
xtool new MyWatchApp
```

Then, you can build your watchOS app with:

```bash
xtool dev --platform watchOS
```

## iOS App with Watch Extension

To create an iOS app with a watchOS extension, you'll need to set up your project with multiple products:

1. Add a new product declaration to your `Package.swift`:

```swift
let package = Package(
    name: "MyApp",
    platforms: [
        .iOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "MyApp",
            targets: ["MyApp"]
        ),
        .library(
            name: "MyWatchApp",
            targets: ["MyWatchApp"]
        ),
        .library(
            name: "MyWatchExtension",
            targets: ["MyWatchExtension"]
        )
    ],
    targets: [
        .target(name: "MyApp"),
        .target(name: "MyWatchApp"),
        .target(name: "MyWatchExtension")
    ]
)
```

2. Update your `xtool.yml` to specify the iOS app and its watchOS extensions:

```yaml
version: 1
bundleID: com.example.MyApp
product: MyApp
extensions:
  - product: MyWatchApp
    infoPath: WatchApp-Info.plist
    type: watchapp
    extensions:
      - product: MyWatchExtension
        infoPath: WatchExtension-Info.plist
        type: watchextension
```

3. Create the required Info.plist files for your watchOS app and extension:

WatchApp-Info.plist:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>WKWatchKitApp</key>
    <true/>
    <key>WKCompanionAppBundleIdentifier</key>
    <string>com.example.MyApp</string>
</dict>
</plist>
```

WatchExtension-Info.plist:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>NSExtension</key>
    <dict>
        <key>NSExtensionAttributes</key>
        <dict>
            <key>WKAppBundleIdentifier</key>
            <string>com.example.MyApp.watchkitapp</string>
        </dict>
        <key>NSExtensionPointIdentifier</key>
        <string>com.apple.watchkit</string>
    </dict>
</dict>
</plist>
```

## Example Project

You can find a complete example project in the [WatchOS-example](WatchOS-example) directory, which includes all the necessary files to build an iOS app with a watchOS extension.

## Platform Support

watchOS support in xtool requires:

- watchOS 8.0 or later
- Xcode 13.0 or later for building
- A valid Apple Developer account for signing and deployment

## Limitations

While most features of xtool work with watchOS, there may be some limitations:

- watchOS apps have more restrictive APIs compared to iOS apps
- Some third-party dependencies may not be compatible with watchOS
- App size limitations are stricter on watchOS

For more information on building watchOS apps, see the [Apple watchOS documentation](https://developer.apple.com/watchos/).