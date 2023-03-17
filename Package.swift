// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AzureMapsControl",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AzureMapsControl",
            targets: ["AzureMapsControl", "MapControlDependencies"]
        )
    ],
    dependencies: [
        .package(
            name: "MapLibre GL Native",
            url: "https://github.com/maplibre/maplibre-gl-native-distribution.git",
            .exact("5.12.0")
        ),
        .package(
            name: "MSAL",
            url: "https://github.com/AzureAD/microsoft-authentication-library-for-objc",
            from: "1.1.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AzureMapsControl",
            url: "https://github.com/Azure/azure-maps-ios-sdk-distribution/releases/download/1.0.0-pre.3/AzureMapsControl.xcframework.zip",
            checksum: "1e45c519faf6dce423752d1f86594718c202cf680af65a47289af6967600811a"
        ),
        .target(
            name: "MapControlDependencies",
            dependencies: [
                .product(
                    name: "Mapbox",
                    package: "MapLibre GL Native",
                    condition: .when(platforms: [.iOS])
                ),
                .product(
                    name: "MSAL",
                    package: "MSAL",
                    condition: .when(platforms: [.iOS])
                )
            ],
            path: "./Sources"
        )
    ]
)
