//
//  MainFeedApp.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim Do hyung on 12/26/23.
//

import Foundation
import SwiftUI

@main
struct MainFeedApp: App {
    var body: some Scene {
        WindowGroup {
            MainFeedFactory().makeMainFeedCoordinator()
//            MainFeedView()
        }
    }
}
