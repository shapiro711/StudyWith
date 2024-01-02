//
//  MainTabApp.swift
//  MainTab
//
//  Created by Kim Do hyung on 12/30/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import Foundation
import SwiftUI
import ComposableArchitecture

@main
struct MainTabApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView(store: MainTabFeature.createStore())
        }
    }
}
