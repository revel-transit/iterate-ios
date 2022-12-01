// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iteratehq",

    
    products: [
        
//        platforms: [
//               .iOS(.v13),
//          ],
//

        .library(
            name: "iteratehq",
            targets: ["iteratehq"]),
    ],
    dependencies: [
        .package(url: "https://github.com/RightPoint/Anchorage", from: "4.5.0"),
       ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "iteratehq",
            dependencies: [

]),
        .testTarget(
            name: "iteratehqTests",
            dependencies: ["iteratehq"]),
    ]
)
