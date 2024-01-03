//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Do hyung on 12/28/23.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeFeatureModule(
    name: "Search",
    product: .staticFramework,
    dependencies: [
        .featureInterface(.Search),
        .userInterface(.DesignSystem),
        .core(.Network)
    ],
    resources: ["Resources/**"],
    infoPlist: .default
)
