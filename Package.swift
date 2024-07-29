// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SwiftUI_MVVMC",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "SwiftUI_MVVMC",
            targets: [
                "SwiftUI_MVVMC",
            ]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUI_MVVMC"
        ),
        .testTarget(
            name: "SwiftUI_MVVMC_Tests",
            dependencies: [
                "SwiftUI_MVVMC",
            ]
        ),
    ]
)
