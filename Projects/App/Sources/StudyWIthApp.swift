//
//  StudyWIthApp.swift
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/21/23.
//

import Foundation
import SwiftUI
import Dependencies
import Swinject

import MainTabInterface
import MainTab
import MainFeedInterface
import MainFeed

@main
struct TestestApp: App {
    let diContainer = DIContainer()
    
    var body: some Scene {
        WindowGroup {
            diContainer.mainTabFactory.makeMainTabView()
        }
    }
}
struct ContentView: View {
    var body: some View {
        TabView {
          Text("The First Tab")
            .tabItem {
              Image(systemName: "1.square.fill")
              Text("First")
            }
          Text("Another Tab")
            .tabItem {
              Image(systemName: "2.square.fill")
              Text("Second")
            }
          Text("The Last Tab")
            .tabItem {
              Image(systemName: "3.square.fill")
              Text("Third")
            }
            .badge(10)
        }
        .font(.headline)
      }
    
}

#Preview {
    ContentView()
}


final class DIContainer {
    let mainTabFactory: MainTabCreateable = MainTabFactory()
    let mainFeedFactory: MainFeedCreateable = MainFeedFactory()
}
