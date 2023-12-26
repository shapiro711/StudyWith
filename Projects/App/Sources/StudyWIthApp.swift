//
//  StudyWIthApp.swift
//  ProjectDescriptionHelpers
//
//  Created by shapiro on 12/21/23.
//

import Foundation
import SwiftUI

@main
struct testestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
