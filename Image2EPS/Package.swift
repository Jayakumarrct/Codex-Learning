// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Image2EPS",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "Image2EPS", targets: ["Image2EPS"]),
    ],
    targets: [
        .target(
            name: "Image2EPS",
            path: "",
            sources: [
                "Image2EPSApp.swift",
                "ContentView.swift",
                "Models",
                "Services",
                "Utilities",
                "ViewModels",
                "Views"
            ]
        ),
        .testTarget(
            name: "Image2EPSTests",
            dependencies: ["Image2EPS"],
            path: "Tests"
        )
    ]
)
