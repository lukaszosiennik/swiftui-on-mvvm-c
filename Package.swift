// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SwiftUI-MVVMC",
    products: [
        .library(
            name: "SwiftUI-MVVMC",
            targets: [
                "SwiftUI-MVVMC",
            ]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUI-MVVMC"
        ),
        .testTarget(
            name: "SwiftUI-MVVMC_Tests",
            dependencies: [
                "SwiftUI-MVVMC",
            ]
        ),
    ]
)
