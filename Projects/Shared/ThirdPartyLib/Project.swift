//
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/21/23.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .staticFramework,
    packages: [
        Package.Moya,
        Package.TCA,
        Package.Kingfisher,
        Package.Swinject
    ],
    dependencies: [
        .package(product: "Moya"),
        .package(product: "ComposableArchitecture"),
        .package(product: "Kingfisher"),
        .package(product: "Swinject")
    ]
)

