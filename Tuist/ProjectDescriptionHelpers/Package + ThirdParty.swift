//
//  Package + ThirdParty.swift
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/22/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

public extension Package {
    static let TCA = Package.remote(
        url: "https://github.com/pointfreeco/swift-composable-architecture",
        requirement: .upToNextMajor(from: "1.5.6")
    )
    
    static let Moya = Package.remote(
        url: "https://github.com/Moya/Moya.git",
        requirement: .upToNextMajor(from: "15.0.0")
    )
    
    static let Kingfisher = Package.remote(
        url: "https://github.com/onevcat/Kingfisher.git",
        requirement: .upToNextMajor(from: "7.10.0")
    )
}
