// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SQDataBase",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "SQDBProtocols", targets: ["SQDBProtocols"]),
        .library(name: "SQRealm", targets: ["SQRealm"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/realm/realm-swift.git",
            .upToNextMajor(from: "10.21.1")
        )
    ],
    targets: [
        .target(
            name: "SQDBProtocols",
            path: "./Sources/SQDBProtocols"
        ),
        .target(
            name: "SQRealm",
            dependencies: [
                "SQDBProtocols",
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift")
            ],
            path: "./Sources/SQRealm"
        )
    ]
)
