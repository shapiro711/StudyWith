//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/21/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "App",
    platform: .iOS,
    product: .app,
    dependencies: [
        .feature(target: "MainFeed", moduleName: "MainFeed")
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: [
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen",
        "ENABLE_TESTS": .boolean(true),
    ])
)
