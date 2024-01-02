//
//  MainFeedFactory.swift
//  MainFeed
//
//  Created by Kim Do hyung on 1/1/24.
//  Copyright © 2024 shapiro. All rights reserved.
//

import Foundation
import SwiftUI
import MainFeedInterface

public class MainFeedFactory: MainFeedCreateable {
    public func makeMainFeedView() -> ContentFlowCoordinator<AnyView> {
        let state = ContentFlowState()
        let mainFeedView = MainFeedView()
        return ContentFlowCoordinator(state: state, content: { AnyView(mainFeedView) })
    }
    
    public init() { }
}

