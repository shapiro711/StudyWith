//
//  Dependency + Project.swift
//  StudyWith
//
//  Created by Kim Do hyung on 12/30/23.
//

import ProjectDescription

public extension TargetDependency {
    static func app(_ appModule: AppModule) -> TargetDependency {
        .project(
            target: appModule.rawValue,
            path: .relativeToRoot("Projects/App/\(appModule.rawValue)")
        )
    }
    
    static func feature(_ featureModule: FeatureModule) -> TargetDependency {
        .project(
            target: featureModule.rawValue,
            path: .relativeToRoot("Projects/Feature/\(featureModule.rawValue)")
        )
    }
    
    static func featureInterface(_ featureModule: FeatureModule) -> TargetDependency {
        .project(
            target: "\(featureModule.rawValue)Interface",
            path: .relativeToRoot("Projects/Feature/\(featureModule.rawValue)")
        )
    }
    
    static func core(_ coreModule: CoreModule) -> TargetDependency {
        .project(
            target: coreModule.rawValue,
            path: .relativeToRoot("Projects/Core/\(coreModule.rawValue)")
        )
    }
    
    static func shared(_ sharedModule: SharedModule) -> TargetDependency {
        .project(
            target: sharedModule.rawValue,
            path: .relativeToRoot("Projects/Shared/\(sharedModule.rawValue)")
        )
    }
    
    static func userInterface(_ userInterfaceModule: UserInterfaceModule) -> TargetDependency {
        .project(
            target: userInterfaceModule.rawValue,
            path: .relativeToRoot("Projects/UserInterface/\(userInterfaceModule.rawValue)")
        )
    }
}


