//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Do hyung on 12/28/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeatureModule(
    name: "MainTab",
    product: .staticLibrary,
    dependencies: [
        .featureInterface(.MainTab),
        .featureInterface(.MainFeed),
        .featureInterface(.Search),
        .featureInterface(.Profile),
        .userInterface(.DesignSystem),
        .core(.Network)
    ],
    resources: ["Resources/**"],
    infoPlist: .default
)
