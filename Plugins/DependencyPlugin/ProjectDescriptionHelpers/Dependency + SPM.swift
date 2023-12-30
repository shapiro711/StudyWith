//
//  Dependency + SPM.swift
//  StudyWith
//
//  Created by Kim Do hyung on 12/29/23.
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
