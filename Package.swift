// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Einsteinium",
    products: [
        .library(name: "Einsteinium", targets: ["Einsteinium"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Einsteinium",
            dependencies: [ ],
            path: "Sources"
        )
    ]
)
