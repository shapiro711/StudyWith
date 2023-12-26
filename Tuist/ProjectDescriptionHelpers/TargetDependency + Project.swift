//
//  TargetDependency + Project.swift
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/22/23.
//

import ProjectDescription

enum AppModule {
    case App
}

enum FeatureModules {
    case MainFeed
}

enum CoreModule {
    case Network
}

enum SharedModule {
    case ThirdPartyLib
}

enum userInterfaceModule {
    case DesignSystem
}

public extension TargetDependency {
    enum Projcet { }
}

//MARK: - App
public extension TargetDependency.Projcet {
    static let app = TargetDependency.project(target: "App", path: .relativeToRoot("Projects/App"))
}

//MARK: - Core
public extension TargetDependency.Projcet {
    static let network = TargetDependency.project(target: "Network", path: .relativeToRoot("Projects/Core/Network"))
}

//MARK: - Shared
public extension TargetDependency.Projcet {
    static let thirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/Shared/ThirdPartyLib"))
}

//MARK: - UserInterface
public extension TargetDependency.Projcet {
    static let designSystem = TargetDependency.project(target: "DesignSystem", path: .relativeToRoot("Projects/UserInterface/DesignSystem"))
}


public extension TargetDependency {
    static func app(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/App/App"))
    }
    
    static func feature(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Feature/\(moduleName)"))
    }
    
    static func core(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Core/\(moduleName)"))
    }
    
    static func shared(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Shared/\(moduleName)"))
    }
    
    static func userInterface(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/UserInterface/\(moduleName)"))
    }
}
