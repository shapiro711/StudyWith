//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Do hyung on 12/25/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DesignSystem",
    product: .staticLibrary,
    dependencies: [
        .shared(target: "ThirdPartyLib", moduleName: "ThirdPartyLib")
    ],
    resources: ["Resources/**"],
    infoPlist: .default
)
