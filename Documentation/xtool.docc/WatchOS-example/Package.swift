// swift-tools-version: 6.0

import PackageDescription

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