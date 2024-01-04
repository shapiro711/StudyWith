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

import MainTab
import MainFeed

@main
struct TestestApp: App {
    static let container = Container()
    let assembler = Assembler([
         MainTabAssembly(),
         MainFeedAssembly()
    ], container: TestestApp.container)
    
    var body: some Scene {
        WindowGroup {
            MainFeedViewBuilder()
        }
    }
    @ViewBuilder
    private func MainFeedViewBuilder() -> some View {
        if let mainFeedView = TestestApp.container.resolve(MainFeedCreateable.self)?.makeMainFeedCoordinator() {
            mainFeedView
        } else {
            Text("Dependency resolution failed")
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
