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
          .project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib"))
      ],
    resources: ["Resources/**"],
    infoPlist: .default
)
