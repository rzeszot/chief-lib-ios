// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Chief",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "Chief", targets: ["Chief"])
    ],
    targets: [
        .target(name: "Chief", dependencies: []),
        .testTarget(name: "ChiefTests", dependencies: ["Chief"])
    ]
)
