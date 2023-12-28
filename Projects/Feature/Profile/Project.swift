//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Do hyung on 12/28/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeatureModule(
    name: "Profile",
    product: .staticFramework,
    dependencies: [
        .userInterface(target: "DesignSystem", moduleName: "DesignSystem"),
        .core(target: "Network", moduleName: "Network")
    ],
    resources: ["Resources/**"],
    infoPlist: .default
)
