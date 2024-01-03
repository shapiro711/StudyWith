//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Do hyung on 12/26/23.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin


let project = Project.makeFeatureModule(
    name: "MainFeed",
    product: .staticFramework,
    dependencies: [
        .featureInterface(.MainFeed),
        .userInterface(.DesignSystem),
        .core(.Network)
    ],
    resources: ["Resources/**"],
    infoPlist: .default
)
