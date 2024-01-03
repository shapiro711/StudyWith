//
//  ContentFlowState.swift
//  MainTab
//
//  Created by Kim Do hyung on 1/1/24.
//  Copyright © 2024 shapiro. All rights reserved.
//

import Foundation
import MainFeedInterface
import SwiftUI

public enum MainTabLink: Hashable, Identifiable {
    case mainFeedLink(text: String?)
    case sheetLink(item: String)
    case coverLink(item: String)

    public var id: String {
        String(describing: self)
    }
}

public class MainTabFlowState: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedItem: MainTabLink?
    @Published var coverItem: MainTabLink?
    
    public init() { }
}

protocol MainTabViewCompatible: View { }

public struct MainTabFlowCoordinator<Content: View>: View {
    
//    let mainFeedFactory: MainFeedCreateable

    @ObservedObject var state: MainTabFlowState
    let content: () -> Content
    
    public init(state: MainTabFlowState,
                @ViewBuilder content: @escaping () -> Content) {
        self.state = state
        self.content = content
    }

    public var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
                    .sheet(item: $state.presentedItem, content: sheetContent)
                    .fullScreenCover(item: $state.coverItem, content: coverContent)
            }
            .navigationDestination(for: MainTabLink.self, destination: linkDestination)
            .navigationDestination(for: String.self, destination: customDestination)
        }
    }

    @ViewBuilder private func linkDestination(link: MainTabLink) -> some View {
        switch link {
        case let .mainFeedLink(text):
//            firstDestination(text)
            EmptyView()
        default:
            EmptyView()
        }
    }

    @ViewBuilder private func sheetContent(item: MainTabLink) -> some View {
        switch item {
        case let .sheetLink(text):
            EmptyView()
        default:
            EmptyView()
        }
    }

    @ViewBuilder private func coverContent(item: MainTabLink) -> some View {
        switch item {
        case let .coverLink(text):
            EmptyView()
        default:
            EmptyView()
        }
    }

    private func customDestination(text: String) -> some View {
        Text(text)
    }

//    private func firstDestination(_ text: String?) -> some View {
//        let mainFeedFactory.
//    }
}
