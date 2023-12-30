//
//  ModuleType.swift
//  DependencyPlugin
//
//  Created by Kim Do hyung on 12/30/23.
//

import ProjectDescription

public enum AppModule: String {
    case App
}

public enum FeatureModule: String {
    case MainFeed
    case MainTab
    case Profile
    case Search
}

public enum CoreModule: String {
    case Network
}

public enum SharedModule: String {
    case ThirdPartyLib
    case FoundationUtility
}

public enum UserInterfaceModule: String {
    case DesignSystem
}
