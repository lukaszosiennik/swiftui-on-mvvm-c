// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SwiftUI_MVVMC",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SwiftUI_MVVMC",
            targets: [
                "SwiftUI_MVVMC"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.56.0")
    ],
    targets: [
        .target(
            name: "SwiftUI_MVVMC",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .testTarget(
            name: "SwiftUI_MVVMC_Tests",
            dependencies: [
                "SwiftUI_MVVMC"
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
)
