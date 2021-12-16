// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Einsteinium",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "Einsteinium", targets: ["Einsteinium"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Einsteinium",
            dependencies: [
                "Logging"
            ],
            path: "Sources"
        )
    ]
)
