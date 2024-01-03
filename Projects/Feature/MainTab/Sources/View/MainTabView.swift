//
//  MainTabView.swift
//  MainTab
//
//  Created by Kim Do hyung on 12/30/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import MainTabInterface

public struct MainTabView: View {
    let flowState = MainTabFlowState()
    let store: StoreOf<MainTabFeature>
    @ObservedObject var viewStore: ViewStoreOf<MainTabFeature>
    
    init(store: StoreOf<MainTabFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: { $0 })
    }
    
    public var body: some View {
        MainTabFlowCoordinator(state: flowState, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            TabView {
                Text(viewStore.state.description)
                    .tabItem {
//                        Image(systemName: "1.square.fill")
                        Text("First")
                    }
                Text("Another Tab")
                    .tabItem {
//                        Image(systemName: "2.square.fill")
                        Text("Second")
                    }
                Text("The Last Tab")
                    .tabItem {
//                        Image(systemName: "3.square.fill")
                        Text("Third")
                    }
                    .badge(10)
            }
            .font(.headline)
        }
        .navigationBarTitle("Title", displayMode: .inline)
    }
}

#Preview {
    MainTabView(store: MainTabFeature.createStore())
}
