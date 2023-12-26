//
//  TargetDependency + Project.swift
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/22/23.
//

import ProjectDescription

public extension TargetDependency {
    enum Projcet { }
}

public extension TargetDependency.Projcet {
    static let Network = TargetDependency.project(target: "Network", path: .relativeToRoot("Projects/Network"))
    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib"))
}
