//
//  TargetDependency + SPM.swift
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/22/23.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM { }
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let TCA = TargetDependency.external(name: "ComposableArchitecture")
}
