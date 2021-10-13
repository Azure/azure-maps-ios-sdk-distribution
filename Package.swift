// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AzureMapsControl",
    platforms: [.iOS(.v13)],
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
            from: "5.12.1"
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
            url: "https://github.com/Azure/azure-maps-ios-sdk-distribution/releases/download/1.0.0-pre.1/AzureMapsControl.xcframework.zip",
            checksum: "5a6f4b82885f21e108a3195d57d8c8305543229aee6a913b500a35b6a7b4e5a8"
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
