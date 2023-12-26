//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Do hyung on 12/26/23.
//

import ProjectDescription
import ProjectDescriptionHelpers


let project = Project.makeFeatureModule(
    name: "MainFeed",
    product: .staticFramework,
    dependencies: [
        .userInterface(target: "DesignSystem", moduleName: "DesignSystem"),
        .core(target: "Network", moduleName: "Network")
    ],
    resources: ["Resources/**"],
    infoPlist: .default
)
