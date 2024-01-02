//
//  MainTabFactory.swift
//  MainTab
//
//  Created by Kim Do hyung on 1/1/24.
//  Copyright © 2024 shapiro. All rights reserved.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import MainTabInterface

public class MainTabFactory: MainTabCreateable {
    public func makeMainTabView() -> ContentFlowCoordinator<AnyView> {
        let state = ContentFlowState()
        let store = MainTabFeature.createStore()
        let mainTabView = MainTabView(store: store)
        return ContentFlowCoordinator(state: state, content: { AnyView(mainTabView) })
    }
    
    public init() { }
}

