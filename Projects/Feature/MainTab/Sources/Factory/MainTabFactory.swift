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
import MainFeedInterface

public class MainTabFactory: MainTabCreateable {
    private let mainFeedFactory: MainFeedCreateable
    
    public init(mainFeedFactory: MainFeedCreateable) {
        self.mainFeedFactory = mainFeedFactory
    }
    
    public func makeMainTabCoordinator() -> MainTabFlowCoordinator<AnyView> {
        let state = MainTabFlowState()
        let store = MainTabFeature.createStore()
        let mainTabView = MainTabView(store: store)
        return MainTabFlowCoordinator(state: state, content: { AnyView(mainTabView) })
    }
}

