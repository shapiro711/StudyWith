//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/21/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Network",
    product: .staticFramework,
    dependencies: [
        .shared(.ThirdPartyLib),
        .shared(.FoundationUtility)
      ],
    resources: ["Resources/**"],
    infoPlist: .default
)
