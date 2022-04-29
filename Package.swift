// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Algo",
    products: [
        .library(name: "Algo", targets: ["Algo"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Algo", dependencies: []),
        .testTarget(name: "AlgoTests", dependencies: ["Algo"]),
    ]
)
