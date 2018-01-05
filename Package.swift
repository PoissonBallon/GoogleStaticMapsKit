// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GoogleStaticMapsKit",
  products: [
    .library(name: "GoogleStaticMapsKit", targets: ["GoogleStaticMapsKit"]),
    ],
  dependencies: [],
  targets: [
    .target(name: "GoogleStaticMapsKit",dependencies: [],path: "Sources"),
    .testTarget(name: "GoogleStaticMapsKitTests", dependencies: ["GoogleStaticMapsKit"],path: "Tests"),
    ]
)
